import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/fonts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/controllers/settings_controller.dart';
import 'package:emart_app/views/login_view/login_view.dart';
import 'package:emart_app/views/terms_conditions_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        elevation: 0.0,
        title: AppStyles.bold(
            title: AppStrings.settings,
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ListTile(
                    leading:
                        CircleAvatar(child: Image.asset(AppAssets.imgSignup)),
                    title: AppStyles.bold(title: controller.username.value),
                    subtitle: AppStyles.normal(title: controller.email.value),
                  ),
                  const Divider(),
                  10.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: settingsList.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () async {
                        if (index == 2) {
                          AuthController().signout();
                          Get.offAll(() => const LoginView());
                        } else if (index == 0) {
                          _showChangePasswordDialog(context, controller);
                        } else if (index == 1) {
                          // Handle Terms & Conditions tap
                          Get.to(() => const TermsConditionsView());
                        }
                      },
                      leading: Icon(
                        settingsListIcon[index],
                        color: AppColors.blueColor,
                      ),
                      title: AppStyles.bold(
                        title: settingsList[index],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  void _showChangePasswordDialog(
      BuildContext context, SettingsController controller) {
    final _passwordController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Change Password"),
        content: TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(hintText: "Enter new password"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              controller.changePassword(_passwordController.text);
              Navigator.of(context).pop();
            },
            child: const Text("Change"),
          ),
        ],
      ),
    );
  }
}
