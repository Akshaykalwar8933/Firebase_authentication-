import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (name.isNotEmpty || email.isNotEmpty || password.isNotEmpty) {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await firebaseFirestore
            .collection("users")
            .doc(credential.user!.uid)
            .set({
          'name': name,
          'email': email,
          'uid': credential.user!.uid,
        });
        res = "Success";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Invalid credential";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res = "Success";
      }else{
        res = "Please enter the all field";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

   Future<void> signOut() async {
    await auth.signOut();
  }
}
