import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learn_auth/presentation/screens/signup/snackbar.dart';
import '../../../services/authentication.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../home_view.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void signupUser() async {
    String res = await AuthServices().signUpUser(
      name: nameController.text,
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
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 270.h,
              width: ScreenUtil().screenWidth,
              child: Image.asset("assets/images/signup.jpeg"),
            ),
            TextFieldInput(
              textEditingController: nameController,
              hintText: 'Enter your name',
              icon: Icons.person,
            ),
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
            MyButtons(
              tapButton: signupUser,
              myText: 'Sign Up',
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const LoginScreen());
                  },
                  child: Text(
                    " Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
