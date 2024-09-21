// Inside views/change_password_view.dart
import 'package:emart_app/consts/fonts.dart';
import 'package:emart_app/controllers/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/consts/consts.dart';

class ChangePasswordView extends StatelessWidget {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        elevation: 0.0,
        title: AppStyles.bold(
            title: 'Change Password',
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _currentPasswordController,
              decoration: InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_newPasswordController.text ==
                    _confirmPasswordController.text) {
                  // Call the method to change the password
                  await PasswordController().changePassword(
                    _currentPasswordController.text,
                    _newPasswordController.text,
                  );
                  Get.back();
                } else {
                  // Show error message
                  Get.snackbar('Error', 'Passwords do not match');
                }
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
