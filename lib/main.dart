import 'package:emart_app/consts/fonts.dart';
import 'package:emart_app/firebase_options.dart';

import 'package:emart_app/views/onboardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.nunito),
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
