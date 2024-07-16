import 'package:ecommmerce/Controllers/SignUp_controller.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_Feilds_Widget.dart';
import 'package:ecommmerce/Widgets/login_Widgets/Login_button_Widget.dart';
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
              child: Column(
                children: [
                  Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/login/signup.png'),
                            fit: BoxFit.cover),
                      )),
                  SizedBox(
                    height: 20.h,
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
                    controller: signupcontroller.emailcontroller,
                    icons: Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LoginFeildsWidget(
                      Obscure: true,
                      Labeltext: 'Password',
                      controller: signupcontroller.passcontroller,
                      icons: Icon(Icons.lock)),
                  SizedBox(
                    height: 20.h,
                  ),
                  LoginFeildsWidget(
                      Labeltext: 'Confirm password',
                      controller: signupcontroller.cpasscontroller,
                      icons: Icon(Icons.lock_open),
                      Obscure: true),
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
                      signupcontroller.CheckValues();
                      // signupcontroller.LogUserIn();
                    },
                    text: 'REGISTER',
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
