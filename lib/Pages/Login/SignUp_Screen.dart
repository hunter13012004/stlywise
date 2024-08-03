import 'package:ecommmerce/Controllers/SignUp_controller.dart';
import 'package:ecommmerce/Pages/Login/Login_Screen.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_Feilds_Widget.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_button_Widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = GlobalKey<FormState>();
  var signupcontroller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        key: formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context)
                  .size
                  .height, // Ensures the container takes the full height of the screen
              child: Stack(
                // Wrap the content in a Stack
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/login/signup.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
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
                        validator: signupcontroller.validateEmail(),
                        Obscure: false,
                        Labeltext: 'Email',
                        controller: signupcontroller.emailcontroller,
                        icons: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      LoginFeildsWidget(
                        validator: signupcontroller.validatepassword(),
                        Obscure: true,
                        Labeltext: 'Password',
                        controller: signupcontroller.passcontroller,
                        icons: Icon(Icons.lock),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      LoginFeildsWidget(
                        validator: signupcontroller.validateConfirmpassword(),
                        Labeltext: 'Confirm password',
                        controller: signupcontroller.cpasscontroller,
                        icons: Icon(Icons.lock_open),
                        Obscure: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                          ],
                        ),
                      ),
                      LoginButtonWidget(
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            signupcontroller.CheckValues();
                          } else {
                            return null;
                          }
                        },
                        text: 'REGISTER',
                      ),
                    ],
                  ),
                  Align(
                    // Add Align widget here
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20.0), // Add padding if needed
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                            ),
                            TextSpan(
                              text: 'Get back ',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.offAll(() => LoginPage());
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
