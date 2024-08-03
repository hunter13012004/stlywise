import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFeildsWidget extends StatelessWidget {
  final String Labeltext;
  final bool Obscure;
  final TextEditingController controller;
  final Icon icons;
  final String? Function(String?)? validator;
  const LoginFeildsWidget(
      {super.key,
      required this.Labeltext,
      required this.controller,
      required this.icons,
      required this.Obscure,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [Colors.white70, Colors.white24])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: TextStyle(fontSize: 12.sp),
            validator: validator,
            obscureText: Obscure,
            controller: controller,
            decoration: InputDecoration(
                icon: icons,
                hintText: Labeltext,
                border: UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ),
    );
  }
}
