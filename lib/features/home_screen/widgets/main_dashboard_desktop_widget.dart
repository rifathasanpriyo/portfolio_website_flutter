import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class MainDashboardDesktopWidget extends StatelessWidget {
  const MainDashboardDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSizes.bodyPadding),
      height: AppSizes.screenSize(context).height / 1.2,
      constraints: BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi,\nI'm Rifat Hasan\nA Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
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
          Image.asset(
            "assets/logo_rifat.png",
            width: AppSizes.screenSize(context).width / 3.5,
          ),
        ],
      ),
    );
  }
}
