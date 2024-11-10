import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldInput extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  // final TextInputType textInputType;
  final TextEditingController textEditingController;

  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      this.isPassword = false,
      required this.hintText,
      required this.icon,
      // required this.textInputType
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: TextField(
        obscureText: isPassword,
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 18.sp,
              color: Colors.black45,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.black45,
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: const Color(0xFFedf0f8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.w),
            )),
      ),
    );
  }
}
