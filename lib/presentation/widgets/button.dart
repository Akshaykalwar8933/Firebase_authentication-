import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButtons extends StatelessWidget {

  final VoidCallback tapButton;
  final String myText;
  const MyButtons({super.key, required this.tapButton, required this.myText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapButton,
      child: Padding(
        padding:  EdgeInsets.all(20.0.r),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          decoration: ShapeDecoration(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0.r),
              )),
          child: Text(
            myText,
            style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
