import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class MainDashboardMobileWidget extends StatelessWidget {
  const MainDashboardMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return             Container(
              margin: EdgeInsets.all(AppSizes.bodyPadding),
              height: AppSizes.screenSize(context).height,
              constraints: BoxConstraints(minHeight: 560.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Image.asset(
                      "assets/logo_rifat.png",
                      width: AppSizes.screenSize(context).width / 3,
                    ),
                  ),
                  SizedBox(height: AppSizes.insidePadding * 3),
                  Text(
                    "Hi,\nI'm Rifat Hasan\nA Flutter Developer",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whitePrimary,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppSizes.insidePadding),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Get in touch"),
                    ),
                  ),
                ],
              ),
            );
  }
}