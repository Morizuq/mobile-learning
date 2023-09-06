// import 'package:bloc_learning/app_event.dart';
import 'package:bloc_learning/pages/signin/bloc/signin_bloc.dart';
import 'package:bloc_learning/pages/signin/signin.dart';
import 'package:bloc_learning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_learning/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_bloc.dart';
import 'app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AppBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        )
      ],
      child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  // This is the theme of your application.
                  appBarTheme: const AppBarTheme(
                      elevation: 0, backgroundColor: Colors.white),
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: const Welcome(),
                routes: {
                  "myHomePage": (context) => const MyHomePage(),
                  "signIn": (context) => const SignIn()
                },
              )),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Bloc App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Text(
              "Morizuq Is Still Cooking!",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            );
            // return Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     const Text(
            //       'You have pushed the button this many times:',
            //     ),
            //     Text(
            //       "${BlocProvider.of<AppBloc>(context).state.counter}",
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     ),
            //   ],
            // );
          },
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     FloatingActionButton(
      //       heroTag: "Hero 1",
      //       onPressed: () =>
      //           BlocProvider.of<AppBloc>(context).add(Increment()),
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //     FloatingActionButton(
      //       heroTag: "Hero 2",
      //       onPressed: () =>
      //           BlocProvider.of<AppBloc>(context).add(Decrement()),
      //       tooltip: 'Decrement',
      //       child: const Icon(Icons.remove),
      //     ),
      //   ],
      // )
    );
  }
}
