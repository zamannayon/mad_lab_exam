import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/fonts.dart';
import 'package:emart_app/res/components/custom_button.dart';
import 'package:emart_app/views/book_appointment_view/book_appointment_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(
            title: "Doctor Details",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.bgDarkColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Image.asset(AppAssets.imgSignup),
                  ),
                  15.widthBox,
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppStyles.bold(
                              title: doc['docName'],
                              color: AppColors.textColor,
                              size: AppSizes.size14),
                          AppStyles.bold(
                              title: doc['docCategory'],
                              color: AppColors.textColor.withOpacity(0.5),
                              size: AppSizes.size12),
                          const Spacer(),
                          VxRating(
                            selectionColor: AppColors.yellowColor,
                            onRatingUpdate: (value) {},
                            maxRating: 5,
                            count: 5,
                            value: double.parse(doc['docRating'].toString()),
                            stepInt: true,
                          ),
                        ]),
                  ),
                  AppStyles.bold(
                      title: "See all reviews",
                      color: AppColors.blueColor,
                      size: AppSizes.size12),
                ],
              ),
            ),
            10.heightBox,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.bgDarkColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: AppStyles.bold(
                        title: "Phone Number", color: AppColors.textColor),
                    subtitle: AppStyles.normal(
                        title: doc['docPhone'],
                        color: AppColors.textColor.withOpacity(0.5),
                        size: AppSizes.size12),
                    trailing: Container(
                      width: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.yellowColor,
                      ),
                      child: Icon(
                        Icons.phone,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  10.heightBox,
                  AppStyles.bold(
                      title: "About",
                      color: AppColors.textColor,
                      size: AppSizes.size16),
                  5.heightBox,
                  AppStyles.normal(
                      title: doc['docAbout'],
                      color: AppColors.textColor.withOpacity(0.5),
                      size: AppSizes.size12),
                  10.heightBox,
                  AppStyles.bold(
                      title: "Address",
                      color: AppColors.textColor,
                      size: AppSizes.size16),
                  5.heightBox,
                  AppStyles.normal(
                      title: doc['docAddress'],
                      color: AppColors.textColor.withOpacity(0.5),
                      size: AppSizes.size12),
                  10.heightBox,
                  AppStyles.bold(
                      title: "Working Time",
                      color: AppColors.textColor,
                      size: AppSizes.size16),
                  5.heightBox,
                  AppStyles.normal(
                      title: doc['docTiming'],
                      color: AppColors.textColor.withOpacity(0.5),
                      size: AppSizes.size12),
                  10.heightBox,
                  AppStyles.bold(
                      title: "Services",
                      color: AppColors.textColor,
                      size: AppSizes.size16),
                  5.heightBox,
                  AppStyles.normal(
                      title: doc['docService'],
                      color: AppColors.textColor.withOpacity(0.5),
                      size: AppSizes.size12),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
          buttonText: "Book an appointment",
          onTap: () {
            Get.to(() => BookAppointmentView(
                  docId: doc['docId'],
                  docName: doc['docName'],
                ));
          },
          color: AppColors.whiteColor,
        ),
      ),
      backgroundColor: AppColors.blueColor,
    );
  }
}
