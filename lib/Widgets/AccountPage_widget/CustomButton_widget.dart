import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustombuttonWidget extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  final IconData icons;
  const CustombuttonWidget(
      {super.key,
      required this.ontap,
      required this.text,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50.h,
        width: 180.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icons),
                  SizedBox(
                      width: 8.w), // Adding some space between icon and text
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_right_outlined), // Placing arrow icon here
            ],
          ),
        ),
      ),
    );
  }
}
