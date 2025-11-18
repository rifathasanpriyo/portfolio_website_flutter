import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_input.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_url.dart';
import '../../../core/constants/app_url_launch.dart';



class ContactMeWidget extends StatelessWidget {
    final double screenWidth;

  const ContactMeWidget({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      color: AppColors.bgLight1,
      padding: const EdgeInsets.all(16),
      
      child: Column(
        children: [
          Text(
            "Contact Me",

            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: AppSizes.bodyPadding),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: AppSizes.desktopMediumSize),
            child: Row(
              children: [
                // FIELD 1
                Expanded(child: CustomInputField(hint: "Your name")),

                const SizedBox(width: 12),

                // FIELD 2
                Expanded(child: CustomInputField(hint: "Your mail")),
              ],
            ),
          ),
          SizedBox(height: AppSizes.insidePadding),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: AppSizes.desktopMediumSize),
            child: CustomInputField(maxLines: 6, hint: "Write message"),
          ),
          SizedBox(height: AppSizes.insidePadding),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: AppSizes.desktopMediumSize),

            child: SizedBox(
              width: screenWidth,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Get in touch",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(height: AppSizes.bodyPadding * 2),

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
          const SizedBox(height: AppSizes.bodyPadding),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.mail),
                  SizedBox(width: 4),
                  SelectableText("rifathosan445@gmail.com"),
                ],
              ),
              SizedBox(width: AppSizes.bodyPadding * 2),
              Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 4),
                  SelectableText("+880183035462"),
                ],
              ),
            ],
          ),
          // Row(children: [Icon(Icons.phone), Text("+880183035462")]),
          SizedBox(height: AppSizes.bodyPadding * 4),

          Divider(),
          Text(
            "Made by Rifat Hasan with Flutter",
            style: TextStyle(color: AppColors.hintDark),
          ),
        ],
      ),
    );
  }
}
