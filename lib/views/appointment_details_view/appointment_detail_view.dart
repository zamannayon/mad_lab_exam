import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/fonts.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsView extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetailsView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        elevation: 0.0,
        title: AppStyles.bold(
            title: doc['appWithName'],
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyles.bold(
                title: "Select appointment day",
                size: AppSizes.size18,
                color: AppColors.textColor),
            5.heightBox,
            AppStyles.bold(
                title: doc['appDay'],
                size: AppSizes.size16,
                color: AppColors.textColor.withOpacity(0.5)),
            10.heightBox,
            AppStyles.bold(
                title: "Select appointment time",
                size: AppSizes.size18,
                color: AppColors.textColor),
            5.heightBox,
            AppStyles.bold(
                title: doc['appTime'],
                size: AppSizes.size16,
                color: AppColors.textColor.withOpacity(0.5)),
            20.heightBox,
            AppStyles.bold(
                title: "Mobile Number",
                size: AppSizes.size18,
                color: AppColors.textColor),
            5.heightBox,
            AppStyles.bold(
                title: doc['appMobile'],
                size: AppSizes.size16,
                color: AppColors.textColor.withOpacity(0.5)),
            10.heightBox,
            AppStyles.bold(
                title: "Full Name",
                size: AppSizes.size18,
                color: AppColors.textColor),
            5.heightBox,
            AppStyles.bold(
                title: doc['appName'],
                size: AppSizes.size16,
                color: AppColors.textColor.withOpacity(0.5)),
            10.heightBox,
            AppStyles.bold(
                title: "Message",
                size: AppSizes.size18,
                color: AppColors.textColor),
            5.heightBox,
            AppStyles.bold(
                title: doc['appMsg'],
                size: AppSizes.size16,
                color: AppColors.textColor.withOpacity(0.5)),
          ],
        ),
      ),
    );
  }
}
