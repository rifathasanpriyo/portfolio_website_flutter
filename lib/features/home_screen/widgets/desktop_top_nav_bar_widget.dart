import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_style.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_enum.dart';
import '../../../core/constants/app_sizes.dart';

class DesktopTopNavBarWidget extends StatefulWidget {
  const DesktopTopNavBarWidget({super.key});

  @override
  State<DesktopTopNavBarWidget> createState() => _DesktopTopNavBarWidgetState();
}

class _DesktopTopNavBarWidgetState extends State<DesktopTopNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      margin: EdgeInsets.symmetric(
        vertical: AppSizes.bodyPadding,
        horizontal: AppSizes.insidePadding,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.insidePadding,
        vertical: AppSizes.insidePadding,
      ),
      width: double.maxFinite,
      decoration: AppStyle.headerDecoration,
      child: Row(
        children: [
          Text(
            "RH",
            style: TextStyle(
              color: AppColors.yellowPrimary,
              fontSize: AppSizes.fontSizeExtraLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          for (int i = 0; i < navItemList.length; i++)
            TextButton(
              onPressed: () {},
              child: Text(
                navItemList[i],
                style: TextStyle(
                  color: AppColors.whitePrimary,
                  fontSize: AppSizes.fontSizeLarge,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
