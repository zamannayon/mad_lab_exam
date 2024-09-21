import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var searchQueryController = TextEditingController();
  var isloading = false.obs;

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList() async {
    var doctors = await FirebaseFirestore.instance.collection('doctors').get();
    return doctors;
  }
}
