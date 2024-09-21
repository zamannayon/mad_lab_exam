import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/appointment_view/appointment_view.dart';
import 'package:emart_app/views/category_view/category_view.dart';
import 'package:emart_app/views/home_view/home_view.dart';
import 'package:emart_app/views/login_view/login_view.dart';
import 'package:emart_app/views/settings_view/settings_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    const HomeView(),
    const CategoryView(),
    const AppointmentView(),
    // const LoginView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: AppColors.whiteColor,
        selectedLabelStyle: TextStyle(
          color: AppColors.whiteColor,
        ),
        selectedIconTheme: IconThemeData(
          color: AppColors.whiteColor,
        ),
        backgroundColor: AppColors.blueColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Category "),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Appointment"),
          //BottomNavigationBarItem(icon: Icon(Icons.person), label: "Doctor"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
