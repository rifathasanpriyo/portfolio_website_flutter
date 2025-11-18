import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_colors.dart';
import 'package:portfolio_website/core/constants/app_enum.dart';
import 'package:portfolio_website/core/constants/app_sizes.dart';
import 'package:portfolio_website/features/home_screen/widgets/skill_desktop.dart';

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
            ProjectsSection(screenWidth: screenWidth,),
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: AppSizes.bodyPadding),
            //   width: screenWidth,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "Notable Projects",
            //         style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            //       ),
            //       Container(
            //         // height: 280,
            //         width: 250,
            //         clipBehavior: Clip.antiAlias,
            //         decoration: BoxDecoration(
            //           color: AppColors.hintDark,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           // mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Image.asset(
            //               "assets/skill/tovozo.png",
            //               width: 300,
            //               fit: BoxFit.cover,
            //             ),

            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     "Tovozo",
            //                     style: TextStyle(
            //                       fontSize: 20,
            //                       fontWeight: FontWeight.w600,
            //                       color: AppColors.whitePrimary,
            //                     ),
            //                   ),
            //                   Text(
            //                     "Live hotel location with Google Maps API, in-app messaging via WebSocket,push notifications, real-time job seeker tracking.",
            //                     style: TextStyle(
            //                       fontSize: 10,
            //                       color: AppColors.whiteSecondary,
            //                     ),
            //                   ),
            //                   SizedBox(height: AppSizes.insidePadding),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
