import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_auth/presentation/screens/signup/snackbar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController emailController = TextEditingController();
   final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          myDialogBOx(context);
        },
        child: Text(
          "Forgot Password?",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0.sp,
              color: Colors.blueAccent),
        ),
      ),
    );
  }

  void myDialogBOx(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.0.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text(
                          "Forgot your Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0.sp,
                              color: Colors.black),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close)),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "eg abc@gmail.com",
                        hintStyle:  TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0.sp,
                          color: Colors.black),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0.sp,
                            color: Colors.black),
                        labelText: "Enter your email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                        onPressed: () async {
                        await auth.sendPasswordResetEmail(email: emailController.text).then((value){
                          showSnackBar(context, "We have send a reset link your email id , Please check it");
                        }).onError((error , stackTrace){
                          showSnackBar(context, error.toString());
                        });

                    },
                        child: Text("Send" , style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0.sp,
                            color: Colors.white),)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
