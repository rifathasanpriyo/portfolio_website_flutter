import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_url.dart';
import '../../../core/constants/app_url_launch.dart';

class MainDashboardMobileWidget extends StatelessWidget {
    final VoidCallback onHireMeTap;

  const MainDashboardMobileWidget({super.key, required this.onHireMeTap});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = AppSizes.screenSize(context).width;

    return Container(
      margin: EdgeInsets.all(AppSizes.bodyPadding),
      constraints: const BoxConstraints(minHeight: 560.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // CENTER EVERYTHING
        children: [
          // ----------- Intro Text -----------
          Text(
            "Hi, I'm",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: AppColors.whiteSecondary),
          ),
          Text(
            "Rifat Hasan",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Flutter Developer",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: AppColors.yellowPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: AppSizes.insidePadding * 2),

          // ----------- Social Icons -----------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => openInNewTab(context, AppUrls.github),
                child: Image.asset("assets/skill/github2.png", width: 35),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () => openInNewTab(context, AppUrls.linkedin),
                child: Image.asset("assets/skill/linkdin.png", width: 35),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () => openInNewTab(context, AppUrls.facebook),
                child: Image.asset("assets/skill/fb.png", width: 35),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () => openInNewTab(context, AppUrls.youtube),
                child: Image.asset("assets/skill/youtube.png", width: 35),
              ),
            ],
          ),

          SizedBox(height: AppSizes.insidePadding * 2),

          // ----------- Buttons -----------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onHireMeTap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.bodyPadding * 2,
                    vertical: AppSizes.insidePadding / 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.yellowPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Hire Me",
                    style: TextStyle(
                      color: AppColors.whitePrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppSizes.bodyPadding),
              InkWell(
                onTap: () => openInNewTab(context, AppUrls.resume),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.bodyPadding * 2,
                    vertical: AppSizes.insidePadding / 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.textFieldBg, width: 2),
                  ),
                  child: Text(
                    "Resume",
                    style: TextStyle(
                      color: AppColors.textFieldBg,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // ----------- Stats (responsive) -----------
          // Use Wrap so stats will wrap to next line on small widths instead of overflowing.
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 12,
            children: [
              _buildStat("2+", "Year of Experience"),
              _buildStat("15+", "Projects Completed"),
              _buildStat("3", "Hackathon Participant"),
            ],
          ),

          const SizedBox(height: 30),

          // ----------- Profile Photo -----------
          // Ensure the image width won't exceed available width on small devices.
          Image.asset(
            "assets/logo_rifat.png",
            width: math.min(screenWidth * 0.6, 260), // responsive max width
            fit: BoxFit.contain,
          ),
          SizedBox(height: AppSizes.insidePadding * 2),
          SizedBox(height: AppSizes.insidePadding * 2),
          SizedBox(height: AppSizes.insidePadding * 2),
          SizedBox(height: AppSizes.insidePadding * 2),
        ],
      ),
    );
  }

  // helper for Wrap
  Widget _buildStat(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 110, // restrict label width so it wraps nicely
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
