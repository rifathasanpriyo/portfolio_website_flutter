import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_colors.dart';

class AppStyle{ 
  static  BoxDecoration headerDecoration =  BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, AppColors.bgLight1],
        ),
        borderRadius: BorderRadius.circular(100),
      );
}