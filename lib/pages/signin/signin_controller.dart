import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {}
        if (password.isEmpty) {}

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
                  if(credential.user == null){}
                  if(!credential.user!.emailVerified){
                    //
                  }

                  var user = credential.user;

                  if(user!=null){
                    //Got verified user from firebase
                  }
        } catch (err) {
          //Error getting user from firebase 
        }
      }
    } catch (err) {
      //Error Signing In 
    }
  }
}
