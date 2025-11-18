import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_enum.dart';
import '../../../core/constants/app_sizes.dart';

class SkillDesktop extends StatelessWidget {
  final double screenWidth;
  const SkillDesktop({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.insidePadding,
        vertical: AppSizes.insidePadding,
      ),
      color: AppColors.bgLight1,

      child: Column(
        children: [
          Text(
            "What I can do",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: AppSizes.bodyPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (int i = 0; i < platformItems.length; i++)
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.bgLight2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            platformItems[i]["img"],
                            width: 30,
                          ),
                          title: Text(platformItems[i]["title"]),
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(width: AppSizes.insidePadding * 5),
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 450),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (int i = 0; i < skillItems.length; i++)
                        Chip(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.insidePadding,
                            vertical: AppSizes.insidePadding,
                          ),
                          backgroundColor: AppColors.bgLight2,
                          label: Text(
                            skillItems[i]["title"],
                            style: TextStyle(),
                          ),
                          avatar: Image.asset(skillItems[i]["img"]),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
