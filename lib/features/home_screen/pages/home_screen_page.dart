import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_colors.dart';
import 'package:portfolio_website/core/constants/app_enum.dart';
import 'package:portfolio_website/core/constants/app_sizes.dart';
import 'package:portfolio_website/features/home_screen/widgets/skill_desktop.dart';

import '../../../core/constants/app_input.dart';
import '../../../core/constants/app_url.dart';
import '../../../core/constants/app_url_launch.dart';
import '../widgets/contact_me_widget.dart';
import '../widgets/desktop_top_nav_bar_widget.dart';
import '../widgets/main_dashboard_desktop_widget.dart';
import '../widgets/main_dashboard_mobile_widget.dart';
import '../widgets/mobile_top_nav_bar_widget.dart';
import '../widgets/project_desktop.dart';
import '../widgets/skill_mobile.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        key: scaffoldKey,
        endDrawer: constraints.maxWidth >= AppSizes.desktopMinSize
            ? null
            : Drawer(
                backgroundColor: AppColors.scaffoldBg,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close),
                        ),
                      ),
                      for (int i = 0; i < navItemIcon.length; i++)
                        ListTile(
                          leading: Icon(navItemIcon[i]),
                          title: Text(navItemList[i]),
                        ),
                    ],
                  ),
                ),
              ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //top nav button
            if (constraints.maxWidth >= AppSizes.desktopMinSize)
              DesktopTopNavBarWidget()
            else
              MobileTopNavBarWidget(
                iconPressed: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),

            if (constraints.maxWidth >= AppSizes.desktopMinSize)
              MainDashboardDesktopWidget()
            else
              MainDashboardMobileWidget(),

            //skill
            if (constraints.maxWidth >= AppSizes.desktopMediumSize)
              SkillDesktop(screenWidth: screenWidth)
            else
              SkillMobile(screenWidth: screenWidth),

            //project
            ProjectsSection(screenWidth: screenWidth),
           ContactMeWidget(screenWidth: screenWidth,)
          ],
        ),
      ),
    );
  }
}
