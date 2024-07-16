import 'package:ecommmerce/Controllers/Login_controller.dart';
import 'package:ecommmerce/Pages/Login/Forgot_pwd_Screen.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_Feilds_Widget.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_button_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var logincontroller = Get.put(LoginController());
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        key: formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/login/wel.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(320, 50),
                            bottomRight: Radius.elliptical(220, 50))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login to your Account',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LoginFeildsWidget(
                    Obscure: false,
                    Labeltext: 'Email',
                    controller: logincontroller.emailcontroller,
                    icons: Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LoginFeildsWidget(
                      Obscure: true,
                      Labeltext: 'Password',
                      controller: logincontroller.passcontroller,
                      icons: Icon(Icons.lock)),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ForgotPwdScreen());
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  LoginButtonWidget(
                    ontap: () {
                      logincontroller.LogUserIn();
                    },
                    text: 'LOGIN',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
