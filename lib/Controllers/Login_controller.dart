import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommmerce/Pages/Home/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void logUserIn() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    try {
      // Authenticate user
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Check if user document exists
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .get();

      if (!userDoc.exists) {
        // Create a new user document if it doesn't exist
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'email': email,
          'createdAt': Timestamp.now(), // Use Timestamp instead of DateTime
        });
      }

      // Navigate to HomePage
      Get.offAll(() => HomePage());
    } catch (e) {
      // Handle errors (e.g., authentication errors, network issues)
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
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
        return 'Password cannot be empty';
      }
      return null;
    };
  }
}
