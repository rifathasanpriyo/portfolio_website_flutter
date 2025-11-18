import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_input.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_url.dart';
import '../../../core/constants/app_url_launch.dart';

class ContactMeWidget extends StatefulWidget {
  final double screenWidth;
  final double maxWidth;

  const ContactMeWidget({
    super.key,
    required this.screenWidth,
    required this.maxWidth,
  });

  @override
  State<ContactMeWidget> createState() => _ContactMeWidgetState();
}

class _ContactMeWidgetState extends State<ContactMeWidget> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool sending = false;

  Future sendEmail() async {
    setState(() => sending = true);

    const serviceId = "service_q2mazmi"; // YOUR SERVICE ID
    const templateId = "template_hereehy"; // YOUR TEMPLATE ID
    const publicKey = "cKSnbz7W4GgJHBeX2"; // YOUR PUBLIC KEY

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

    final response = await http.post(
      url,
      headers: {
        "origin": "http://localhost",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": publicKey,
        "template_params": {
          "user_name": nameController.text,
          "user_email": emailController.text,
          "user_message": messageController.text,
        },
      }),
    );

    setState(() => sending = false);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Message sent successfully!")));

      // clear fields
      nameController.clear();
      emailController.clear();
      messageController.clear();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to send. Try again!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth,
      color: AppColors.bgLight1,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Contact Me",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: AppSizes.bodyPadding),

          // NAME + EMAIL
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: AppSizes.desktopMediumSize),
            child: Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    hint: "Your name",
                    controller: nameController,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomInputField(
                    hint: "Your mail",
                    controller: emailController,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppSizes.insidePadding),

          // MESSAGE FIELD
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: AppSizes.desktopMediumSize),
            child: CustomInputField(
              maxLines: 6,
              hint: "Write message",
              controller: messageController,
            ),
          ),

          SizedBox(height: AppSizes.insidePadding),

          // BUTTON
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: AppSizes.desktopMediumSize),
            child: SizedBox(
              width: widget.screenWidth,
              child: ElevatedButton(
                onPressed: sending ? null : sendEmail,
                child: sending
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        "Get in touch",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
              ),
            ),
          ),

          SizedBox(height: AppSizes.bodyPadding * 2),

          // SOCIAL ICONS
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

          SizedBox(height: AppSizes.bodyPadding),

          // CONTACT INFO
          if (widget.maxWidth >= AppSizes.desktopMinSize)
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
            )
          else
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.mail),
                    SizedBox(width: 4),
                    SelectableText("rifathosan445@gmail.com"),
                  ],
                ),
                SizedBox(width: AppSizes.insidePadding),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 4),
                    SelectableText("+880183035462"),
                  ],
                ),
              ],
            ),

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
