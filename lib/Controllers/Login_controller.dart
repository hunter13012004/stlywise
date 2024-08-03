import 'package:ecommmerce/Pages/Home/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  void LogUserIn() async {
    UserCredential? credential;
    String email = emailcontroller.text.trim();
    String password = passcontroller.text.trim();
    credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    // ignore: unnecessary_null_comparison
    if (credential != null) {
      print('user Successfuly Loged In');
      Get.offAll(HomePage());
    }
  }

  String? Function(String?) validateEmail() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Email cannot be empty';
      } else if (!GetUtils.isEmail(value)) {
        return 'Please enter a valid email address';
      }
      return null;
    };
  }

  String? Function(String?) validatePassword() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'password cannot be empty';
      }
      return null;
    };
  }
}
