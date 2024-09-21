import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart'; // Ensure you have this import

class AppFonts {
  static String nunito = "nunito", nunitoBold = "nunito_bold";
}

class AppSizes {
  static const size12 = 12,
      size14 = 14,
      size16 = 16,
      size18 = 18,
      size20 = 20,
      size22 = 22;
}

class AppStyles {
  static normal({
    required String title,
    Color? color = Colors.black,
    int? size = 14,
  }) {
    return title.text.size(size as double?).color(AppColors.textColor).make();
  }

  static bold({
    required String title,
    Color? color = Colors.black,
    int? size = 14,
  }) {
    return title.text
        .size(size as double?)
        .color(color)
        .fontFamily(AppFonts.nunitoBold)
        .make();
  }
}
