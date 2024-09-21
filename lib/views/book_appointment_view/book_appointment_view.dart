import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/fonts.dart';
import 'package:emart_app/controllers/appointment_controller.dart';
import 'package:emart_app/res/components/custom_button.dart';
import 'package:emart_app/res/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;
  const BookAppointmentView(
      {super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.blueColor,
          title: AppStyles.bold(
              title: docName,
              color: AppColors.whiteColor,
              size: AppSizes.size18)),
      body: Container(
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppStyles.bold(title: "Select appointment day"),
                5.heightBox,
                CustomTextfield(
                  hint: "Select day",
                  TextController: controller.appDayController,
                ),
                10.heightBox,
                AppStyles.bold(title: "Select appointment time"),
                5.heightBox,
                CustomTextfield(
                  hint: "Select time",
                  TextController: controller.appTimeController,
                ),
                20.heightBox,
                AppStyles.bold(title: "Mobile Number"),
                5.heightBox,
                CustomTextfield(
                  hint: "Enter your mobile number",
                  TextController: controller.appMobileController,
                ),
                10.heightBox,
                AppStyles.bold(title: "Full Name"),
                5.heightBox,
                CustomTextfield(
                  hint: "Enter your name",
                  TextController: controller.appNameController,
                ),
                10.heightBox,
                AppStyles.bold(title: "Message"),
                5.heightBox,
                CustomTextfield(
                  hint: "Enter your message",
                  TextController: controller.appMessageController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isloading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  buttonText: "Book an appointment",
                  onTap: () async {
                    await controller.bookAppointment(docId, docName, context);
                  },
                  color: AppColors.whiteColor,
                ),
        ),
      ),
      backgroundColor: AppColors.blueColor,
    );
  }
}
