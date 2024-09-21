import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/fonts.dart';
import 'package:emart_app/controllers/appointment_controller.dart';
import 'package:emart_app/views/appointment_details_view/appointment_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(
            title: "Category Name",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: controller.getAppointments(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = snapshot.data?.docs;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          Get.to(() => AppointmentDetailsView(
                                doc: data![index],
                              ));
                        },
                        leading: CircleAvatar(
                          child: Image.asset(AppAssets.imgSignup),
                        ),
                        title:
                            AppStyles.bold(title: data![index]['appWithName']),
                        subtitle: AppStyles.bold(
                            title:
                                "${data[index]['appDay']}-${data[index]['appTime']}",
                            color: AppColors.textColor.withOpacity(0.5)),
                      );
                    }),
              );
            }
          }),
    );
  }
}
