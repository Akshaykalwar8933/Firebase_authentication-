import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../services/authentication.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../home_view.dart';
import '../signup/signup_screen.dart';
import 'package:get/get.dart';

import '../signup/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void loginUsers() async {
    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: passController.text,
    );

    if (res == "Success") {
      setState(() {
        isLoading = true;
      });
      Get.off( HomeSceen());
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 270.h,
                  width: ScreenUtil().screenWidth,
                  child: Image.asset("assets/images/login.jpg")),
              TextFieldInput(
                textEditingController: emailController,
                hintText: 'Enter your Email',
                icon: Icons.email,
              ),
              TextFieldInput(
                textEditingController: passController,
                hintText: 'Enter your Password',
                icon: Icons.lock,
                isPassword: true,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 35.0.w),
              //   child: Align(
              //     alignment: Alignment.centerRight,
              //     child: InkWell(
              //         onTap: () {
              //           Get.to(ForgotPasswordScreen());
              //         },
              //      child: Text("Forget Password?",
              //         style: TextStyle(
              //             color: Colors.blueAccent,
              //             fontSize: 16.sp,
              //             fontWeight: FontWeight.bold),
              //      )
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                child: const ForgotPasswordScreen(),
              ),
              MyButtons(
                tapButton: loginUsers,
                myText: 'Login',
              ),
              SizedBox(
                height: 15.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const SignupScreen());
                    },
                    child: Text(
                      " SignUp",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
