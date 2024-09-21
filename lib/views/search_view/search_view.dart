import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/fonts.dart';
import 'package:emart_app/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blueColor,
          elevation: 0.0,
          title: AppStyles.bold(
              title: "Search Results",
              color: AppColors.whiteColor,
              size: AppSizes.size16),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('doctors').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 170,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var doc = snapshot.data!.docs[index];
                    return !(doc['docName']
                                .toString()
                                .toLowerCase()
                                .toUpperCase())
                            .contains(searchQuery)
                        ? const SizedBox.shrink()
                        : GestureDetector(
                            onTap: () {
                              Get.to(() => DoctorProfileView(doc: doc));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 7, 101, 10),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.only(right: 10),
                              height: 100,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppAssets.imgSignup,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 10),
                                  AppStyles.bold(
                                    title: doc['docName'],
                                    color: AppColors.whiteColor,
                                  ),
                                  VxRating(
                                    selectionColor: AppColors.yellowColor,
                                    onRatingUpdate: (value) {},
                                    maxRating: 5,
                                    count: 5,
                                    value: double.parse(
                                        doc['docRating'].toString()),
                                    stepInt: true,
                                  ),
                                ],
                              ),
                            ));
                  },
                ),
              );
            }
          },
        ));
  }
}
