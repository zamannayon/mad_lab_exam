import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/fonts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/category_details_view/category_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title:
            AppStyles.bold(title: AppStrings.category, size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 190,
            ),
            itemCount: iconList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                      () => CategoryDetailsView(catName: iconTitleList[index]));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 4, 39, 68),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            iconList[index],
                            width: 70,
                          ),
                        ),
                        const Divider(
                          color: Colors.white70,
                        ),
                        20.heightBox,
                        AppStyles.bold(
                          title: iconTitleList[index],
                          color: AppColors.whiteColor,
                          size: AppSizes.size16,
                        ),
                        10.heightBox,
                        AppStyles.bold(
                          title: "13 specialists",
                          color: AppColors.whiteColor,
                          size: AppSizes.size12,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
