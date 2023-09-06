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

        if (emailAddress.isEmpty) {
          print("email is empty");
        }
        if (password.isEmpty) {
          print("password is empty");
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            print("user does not exist");
          }
          if (!credential.user!.emailVerified) {
            print("not verified");
          }

          var user = credential.user;

          if (user != null) {
            //Got verified user from firebase
            print("user exist");
          } else {
            print("user does not exist");
          }
        } on FirebaseAuthException catch (err) {
          //Error getting user from firebase
          if (err.code == 'user-not-found') {
            print("User not found");
          } else if (err.code == 'wrong-password') {
            print("Wrong password!!😆😆");
          } else if (err.code == 'invalid-email') {
            print("Incorrect Email");
          }
        }
      }
    } catch (err) {
      //Error Signing In
    }
  }
}
