import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  var isloading = false.obs;
  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

  bookAppointment(String docId, String docName, context) async {
    isloading(true);
    var store = FirebaseFirestore.instance.collection('appointments').doc();
    await store.set({
      'appBy': FirebaseAuth.instance.currentUser?.uid,
      'appDay': appDayController.text,
      'appTime': appTimeController.text,
      'appMobile': appMobileController.text,
      'appName': appNameController.text,
      'appMsg': appMessageController.text,
      'appWith': docId,
      'appWithName': docName
    });
    isloading(false);
    VxToast.show(context, msg: "Appointment is booked successfully!");
    Get.back();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments() {
    return FirebaseFirestore.instance.collection('appointments').get();
  }
}
