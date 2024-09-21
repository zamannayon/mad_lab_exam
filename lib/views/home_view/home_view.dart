import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/controllers/home_controller.dart';
import 'package:emart_app/views/category_details_view/category_details_view.dart';
import 'package:emart_app/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:emart_app/views/search_view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/fonts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/res/components/custom_textfield.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyles.bold(
          title: "${AppStrings.welcome} User",
          color: AppColors.whiteColor,
          size: AppSizes.size18,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            color: AppColors.blueColor,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextfield(
                    TextController: controller.searchQueryController,
                    hint: AppStrings.search,
                    borderColor: AppColors.whiteColor,
                    textColor: AppColors.whiteColor,
                    inputColor: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Get.to(() => SearchView(
                          searchQuery: controller.searchQueryController.text,
                        ));
                  },
                  icon: const Icon(Icons.search),
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: iconList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryDetailsView(
                                catName: iconTitleList[index]));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(13),
                            margin: const EdgeInsets.only(right: 8),
                            child: Column(
                              children: [
                                Image.asset(
                                  iconList[index],
                                  width: 45,
                                  height: 45,
                                ),
                                const SizedBox(height: 5),
                                AppStyles.bold(
                                    title: iconTitleList[index],
                                    color: AppColors.whiteColor),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppStyles.bold(
                    title: "Popular Doctors",
                    color: AppColors.blueColor,
                    size: AppSizes.size18,
                  ),
                ),
                20.heightBox,
                FutureBuilder<QuerySnapshot>(
                    future: controller.getDoctorList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var data = snapshot.data?.docs;
                        return SizedBox(
                          height: 170,
                          child: ListView.builder(
                            padding: EdgeInsets.all(5),
                            scrollDirection: Axis.horizontal,
                            itemCount: data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      DoctorProfileView(doc: data![index]));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.blueColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 170,
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        AppAssets.imgSignup,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 20),
                                      AppStyles.bold(
                                        title: data![index]['docName'],
                                        color: AppColors.whiteColor,
                                      ),
                                      10.heightBox,
                                      AppStyles.bold(
                                        title: data[index]['docCategory'],
                                        color: AppColors.whiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }),
                // 20.heightBox,
                //Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //children: List.generate(4, (index) {
                //return Container(
                //decoration: BoxDecoration(
                //color: AppColors.blueColor,
                //borderRadius: BorderRadius.circular(12),
                //),
                //padding: const EdgeInsets.all(12),
                //height: 100,
                //width: 100,
                //child: Column(
                //children: [
                //Image.asset(
                //AppAssets.icBody,
                //width: 35,
                //),
                //const SizedBox(height: 15),
                //AppStyles.normal(
                //title: "Lab Test",
                //color: AppColors.whiteColor,
                //),
                //],
                //),
                //);
                //}),
                //),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
