import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_enum.dart';
import '../../../core/constants/app_sizes.dart';

class SkillMobile extends StatelessWidget {
  final double screenWidth;
  const SkillMobile({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.insidePadding,
        vertical: AppSizes.insidePadding,
      ),
      color: AppColors.bgLight1,

      child: Center(
        // <-- This allows constraints to apply!
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500.0),

          child: Column(
            children: [
              Text(
                "What I can do",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: AppSizes.bodyPadding),

              // Fixed accidental width
              SizedBox(height: AppSizes.insidePadding * 2),

              for (int i = 0; i < platformItems.length; i++)
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: AppSizes.insidePadding / 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.bgLight2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Image.asset(platformItems[i]["img"], width: 30),
                    title: Text(platformItems[i]["title"]),
                  ),
                ),
              SizedBox(height: AppSizes.insidePadding),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  for (int i = 0; i < skillItems.length; i++)
                    Chip(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.insidePadding,
                      ),
                      backgroundColor: AppColors.bgLight2,
                      label: Text(skillItems[i]["title"]),
                      avatar: Image.asset(skillItems[i]["img"]),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
