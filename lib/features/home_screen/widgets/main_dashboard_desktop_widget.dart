import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_url.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_url_launch.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, I'm",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: AppColors.whiteSecondary),
              ),
              Text(
                "Rifat Hasan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Flutter Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.yellowPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.insidePadding * 2),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      openInNewTab(context, AppUrls.github);
                    },
                    child: Image.asset("assets/skill/github2.png"),
                  ),
                  SizedBox(width: AppSizes.insidePadding),
                  InkWell(
                    onTap: () => openInNewTab(context, AppUrls.linkedin),
                    child: Image.asset("assets/skill/linkdin.png"),
                  ),
                  SizedBox(width: AppSizes.insidePadding),

                  InkWell(
                    onTap: () => openInNewTab(context, AppUrls.facebook),
                    child: Image.asset("assets/skill/fb.png"),
                  ),
                  SizedBox(width: AppSizes.insidePadding),

                  InkWell(
                    onTap: () => openInNewTab(context, AppUrls.youtube),
                    child: Image.asset("assets/skill/youtube.png"),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.insidePadding * 2),

              // SizedBox(
              //   width: 250,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text("Get in touch"),
              //   ),
              // ),
              Row(
                children: [
                  Container(
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
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
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
                        border: Border.all(
                          color: AppColors.textFieldBg,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Resume",
                        style: TextStyle(
                          color: AppColors.textFieldBg,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.bodyPadding * 2),

              Wrap(
                spacing: 60,
                runSpacing: 20,
                children: [
                  _buildStat("2+", "Year of Experience"),
                  _buildStat("15+", "Projects Completed"),
                  _buildStat("3", "Hackathon Participant"),
                ],
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

  Widget _buildStat(String value, String label) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
