import 'package:ecommmerce/Controllers/SignUp_controller.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_Feilds_Widget.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_button_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompleteprofileScreen extends StatefulWidget {
  const CompleteprofileScreen({super.key});

  @override
  State<CompleteprofileScreen> createState() => _CompleteprofileScreenState();
}

class _CompleteprofileScreenState extends State<CompleteprofileScreen> {
  final SignupController signupcontroller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        height: MediaQuery.of(context).size.height.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircleAvatar to display the profile image

              SizedBox(
                height: 20.h,
              ),
              // First Name Field
              LoginFeildsWidget(
                Labeltext: 'First Name',
                controller: signupcontroller.firstnamecontroller,
                icons: Icon(Icons.person),
                Obscure: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              // Last Name Field
              LoginFeildsWidget(
                Labeltext: 'Last Name',
                controller: signupcontroller.secondnamecontroller,
                icons: Icon(Icons.person),
                Obscure: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              // Complete Button
              LoginButtonWidget(
                ontap: () {
                  signupcontroller.updateProfile();
                },
                text: 'Complete',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
