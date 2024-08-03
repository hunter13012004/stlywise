import 'package:ecommmerce/Controllers/Login_controller.dart';
import 'package:ecommmerce/Pages/Login/Forgot_pwd_Screen.dart';
import 'package:ecommmerce/Pages/Login/SignUp_Screen.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_Feilds_Widget.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_button_Widget.dart';
import 'package:flutter/gestures.dart';
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
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/login/wel.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(320, 50),
                              bottomRight: Radius.elliptical(220, 50),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login to your Account',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        LoginFeildsWidget(
                          validator: logincontroller.validateEmail(),
                          Obscure: false,
                          Labeltext: 'Email',
                          controller: logincontroller.emailController,
                          icons: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        LoginFeildsWidget(
                          validator: logincontroller.validatePassword(),
                          Obscure: true,
                          Labeltext: 'Password',
                          controller: logincontroller.passwordController,
                          icons: Icon(Icons.lock),
                        ),
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
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        LoginButtonWidget(
                          ontap: () {
                            if (formkey.currentState!.validate()) {
                              logincontroller.logUserIn();
                            } else {
                              print('error Logging in');
                            }
                          },
                          text: 'LOGIN',
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account? ',
                            ),
                            TextSpan(
                              text: 'Create one',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => SignUpPage());
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
