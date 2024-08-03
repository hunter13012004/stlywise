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
  String selectedoption = 'male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        height: MediaQuery.of(context).size.height.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Complete Profile',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.sp,
                    color: Colors.white),
              ),
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
              LoginFeildsWidget(
                  Labeltext: 'Phone',
                  controller: signupcontroller.phonecontroller,
                  icons: Icon(Icons.phone),
                  Obscure: false),
              SizedBox(
                height: 20.h,
              ),

              Container(
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                            activeColor: Colors.white,
                            value: 'male',
                            groupValue: selectedoption,
                            onChanged: (value) {
                              setState(() {
                                selectedoption = value!;
                              });
                            }),
                        Text(
                          'Male',
                          style: TextStyle(
                              color: selectedoption == 'male'
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        Radio(
                            activeColor: Colors.white,
                            value: 'female',
                            groupValue: selectedoption,
                            onChanged: (value) {
                              setState(() {
                                selectedoption = value!;
                              });
                            }),
                        Text(
                          'Female',
                          style: TextStyle(
                              color: selectedoption == 'female'
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50.w,
                          child: TextField(
                            decoration: InputDecoration(hintText: 'Age'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Complete

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
