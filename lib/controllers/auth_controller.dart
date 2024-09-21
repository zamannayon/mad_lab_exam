import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  UserCredential? userCredential;

  @override
  void onClose() {
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  signupUser(String email, String password) async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        await storeUserData(userCredential!.user!.uid, fullnameController.text,
            emailController.text, passwordController.text);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  storeUserData(
      String uid, String fullname, String email, String password) async {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    await store.set({
      'fullname': fullname,
      'email': email,
      'password': password,
      'createdAt': Timestamp.now(),
    });
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  loginUser(String s, String t) {}
}
