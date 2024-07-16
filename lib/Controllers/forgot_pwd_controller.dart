import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPwdController extends GetxController {
  final TextEditingController emailcontroller = TextEditingController();

  void ResetPassword() {
    String email = emailcontroller.text.trim();

    if (email != '') {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } else {
      return print('Email is Empty');
    }
  }
}
