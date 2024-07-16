import 'package:ecommmerce/Controllers/forgot_pwd_controller.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_Feilds_Widget.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_button_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPwdScreen extends StatefulWidget {
  const ForgotPwdScreen({super.key});

  @override
  State<ForgotPwdScreen> createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  @override
  Widget build(BuildContext context) {
    var forgotpwdcontroller = Get.put(ForgotPwdController());

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
                            image: AssetImage("assets/login/fwd1.png"))),
                    height: 300.h),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Forgot Password ? ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Let us help you',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white60,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20.h,
                ),
                LoginFeildsWidget(
                    Labeltext: 'Enter your Email',
                    controller: forgotpwdcontroller.emailcontroller,
                    icons: Icon(Icons.email),
                    Obscure: false),
                SizedBox(
                  height: 30.h,
                ),
                LoginButtonWidget(
                    ontap: () {
                      forgotpwdcontroller.ResetPassword();
                    },
                    text: 'RESET')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
