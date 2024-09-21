import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/login_view/login_view.dart';

import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              const Text(
                "BISMILLAHIR RAHMANIR RAHIM",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              const Text(
                "Welcome to DBA!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                "Doctor Booking App",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 15),
              Container(
                height: 370,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Image.asset('assets/images/flutterwave.png'),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12, blurRadius: 5, spreadRadius: 2)
                    ],
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16)),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: const Text(
                          "The social media platform designed to get you offline",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      30.heightBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: const Text(
                          "DBA is an app where users can book appointments to their own choices to find various doctors to get services.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                      30.heightBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          color: AppColors.blueColor,
                          elevation: 2,
                          onPressed: _isLoading
                              ? null
                              : () async {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await Future.delayed(
                                      const Duration(milliseconds: 700));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginView(),
                                    ),
                                  );
                                  setState(() {
                                    _isLoading = false;
                                  });
                                },
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff274560)),
                                )
                              : const Text(
                                  "Get Started",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
