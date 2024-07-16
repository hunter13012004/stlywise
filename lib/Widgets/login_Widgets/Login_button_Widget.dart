import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButtonWidget extends StatelessWidget {
  final Function() ontap;
  final String text;

  const LoginButtonWidget({super.key, required this.ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 50.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Color(0xff203f81),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
