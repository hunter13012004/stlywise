import 'package:ecommmerce/Pages/Home/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController cpasscontroller = TextEditingController();

  void CheckValues() {
    String email = emailcontroller.text.trim();
    String password = passcontroller.text.trim();
    String cpass = cpasscontroller.text.trim();

    // ignore: unnecessary_null_comparison
    if (email == null || password == null) {
      print('Email and password cannot be null');

      if (password == cpass) {
        print('Password do not match');
      }
    } else {
      registerNewUser(email: email, password: password);
    }
  }

  void registerNewUser(
      {required String email, required String password}) async {
    UserCredential? credential;
    credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    // ignore: unnecessary_null_comparison
    if (credential != null) {
      Get.off(HomePage());
    }
  }
}
