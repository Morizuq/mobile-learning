import 'package:bloc_learning/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        //Height determins the thickness of the drawn line
        height: 1.0,
      ),
    ),
    title: Text(
      "Log In",
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
    centerTitle: true,
  );
}

//Context is needed because of bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(right: 70.w, left: 70.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("google"),
        _loginButton("apple"),
        _loginButton("facebook"),
      ],
    ),
  );
}

Widget _loginButton(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.w,
      width: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 16.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(color: AppColors.primaryText)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            width: 16.w,
            height: 16.w,
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              ),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            ),
          )
        ],
      ));
}

Widget forgotPassword() {
  return Container(
    width: 260.h,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text("Forgot Password?",
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              decoration: TextDecoration.underline,
              fontSize: 12.sp,
              decorationColor: AppColors.primaryElement)),
    ),
  );
}

Widget buildLoginAndSignupButton(String buttonName, String type) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        width: 325.w,
        height: 50.h,
        margin: EdgeInsets.only(top: 20.h),
        decoration: BoxDecoration(
            color: type == "login"
                ? AppColors.primaryElement
                : AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                  color: Colors.grey.withOpacity(0.1)),
            ],
            border: type == "login"
                ? null
                : Border.all(
                    color: AppColors.primaryFourElementText,
                  )),
        child: Center(
            child: Text(buttonName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: type == "login"
                      ? AppColors.primaryBackground
                      : AppColors.primaryText,
                )))),
  );
}
