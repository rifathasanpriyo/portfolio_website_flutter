import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_style.dart';

class MobileTopNavBarWidget extends StatefulWidget {
  const MobileTopNavBarWidget({super.key,this.iconPressed});
  final VoidCallback ? iconPressed ;

  @override
  State<MobileTopNavBarWidget> createState() => _MobileTopNavBarWidgetState();
}

class _MobileTopNavBarWidgetState extends State<MobileTopNavBarWidget> {
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
          IconButton(onPressed:  widget.iconPressed , icon: Icon(Icons.menu_sharp)),
        ],
      ),
    );
  }
}
