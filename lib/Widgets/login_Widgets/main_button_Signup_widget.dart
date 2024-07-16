import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButtonSignWidget extends StatelessWidget {
  final String text;
  final Function() ontap;
  const MainButtonSignWidget(
      {super.key, required this.text, required this.ontap});

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
              border: Border.all(), borderRadius: BorderRadius.circular(40)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
