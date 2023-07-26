// import 'package:bloc_learning/main.dart';
import 'package:bloc_learning/pages/welcome/bloc/welcome_events.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'bloc/welcome_blocs.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  //For animation
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Scaffold(
              body: Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) => {
                    state.page = index,
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent())
                  },
                  children: [
                    _page(
                        1,
                        context,
                        "Next",
                        "Oya Start Learning!",
                        "Forget about paper, all knowledge at your fingertips! lorem ipsum sitor dolor bla bla bla and bla bla bla",
                        "assets/images/reading.png"),
                    _page(
                        2,
                        context,
                        "Next",
                        "Connect With Everyone",
                        "Always keep in touch with your tutor and friends, let's get connected!",
                        "assets/images/boy.png"),
                    _page(
                        3,
                        context,
                        "Get Started",
                        "Top Notch - Idan Level",
                        "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                        "assets/images/man.png")
                  ],
                ),
                Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ))
              ],
            ),
          )),
        );
      },
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 24.sp,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 11.h),
          child: Text(
            subTitle,
            style: TextStyle(
                fontSize: 17.sp,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => const MyHomePage()));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1))
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.w,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
