
import 'package:flutter/material.dart';
import 'package:learn_auth/services/authentication.dart';
import 'package:get/get.dart';
import '../widgets/button.dart';
import 'login/login_screen.dart';

class HomeSceen extends StatelessWidget {
   HomeSceen({super.key});

  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Congratulations\nYou have been succesfully login",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            MyButtons(tapButton: () async {
              await authServices.signOut();
              Get.to(LoginScreen());

            }, myText: 'Logout',)
          ],
        ),
      ),
    );
  }
}
