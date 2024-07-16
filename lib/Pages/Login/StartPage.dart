import 'package:ecommmerce/Pages/Login/Login_Screen.dart';
import 'package:ecommmerce/Pages/Login/SignUp_Screen.dart';
import 'package:ecommmerce/Widgets/login_Widgets/main_button_Login_widget.dart';
import 'package:ecommmerce/Widgets/login_Widgets/main_button_Signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Startpage extends StatefulWidget {
  const Startpage({super.key});

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/login/main.png'))),
                    height: 400.h),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'STYLEWISE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MainButtonLoginWidget(
                    text: 'LOGIN',
                    ontap: () {
                      Get.to(() => LoginPage());
                    }),
                SizedBox(
                  height: 20,
                ),
                MainButtonSignWidget(
                    text: 'SIGNUP',
                    ontap: () {
                      Get.to(() => SignUpPage());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
