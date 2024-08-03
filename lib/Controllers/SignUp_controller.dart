import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommmerce/Models/User_model.dart';
import 'package:ecommmerce/Pages/Home/Home.dart';
import 'package:ecommmerce/Pages/Login/CompleteProfile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController cpasscontroller = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController secondnamecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();

  XFile? pickedImaged;

  void pickImage(ImageSource image) async {
    final XFile? imagefile = await ImagePicker().pickImage(source: image);
    pickedImaged = imagefile;
  }

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

  void registerNewUser({
    required String email,
    required String password,
  }) async {
    UserCredential? credential;

    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final UserModel usermodel = UserModel(
          FirstName: '', LastName: '', Email: emailcontroller.text.trim());

      DocumentSnapshot userdoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .get();
      if (!userdoc.exists) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(usermodel.toMap());

        Get.off(CompleteprofileScreen());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }

    // ignore: unnecessary_null_comparison
  }

  void updateProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      UserModel userModel = UserModel(
        FirstName: firstnamecontroller.text.trim(),
        LastName: secondnamecontroller.text.trim(),
        phone: phonecontroller.text.trim(),
        age: agecontroller.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .set(userModel.toMap());

      if (firstnamecontroller.text.trim().isNotEmpty ||
          secondnamecontroller.text.trim().isNotEmpty) {
        Get.offAll(HomePage());
      } else {
        return print('error');
      }
    } catch (e) {}
  }

  String? Function(String?) validateEmail() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Email cannot be empty';
      } else if (!GetUtils.isEmail(value)) {
        return 'Please enter a valid email address';
      } else if (!value.contains('@gmail.com')) {
        return 'Invalid Email address';
      }
      return null;
    };
  }

  String? Function(String?) validatepassword() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'password cannot be empty';
      } else if (value.length <= 6) {
        return ' password should be more than 6 words';
      }
      return null;
    };
  }

  String? Function(String?) validateConfirmpassword() {
    return (value) {
      if (value != passcontroller.text.trim()) {
        return ' passwords do not match ';
      }
      return null;
    };
  }
}
