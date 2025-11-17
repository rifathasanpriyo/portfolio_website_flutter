import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_colors.dart';
import 'package:portfolio_website/core/constants/app_enum.dart';
import 'package:portfolio_website/core/constants/app_sizes.dart';
import 'package:portfolio_website/features/home_screen/widgets/skill_desktop.dart';

import '../widgets/desktop_top_nav_bar_widget.dart';
import '../widgets/main_dashboard_desktop_widget.dart';
import '../widgets/main_dashboard_mobile_widget.dart';
import '../widgets/mobile_top_nav_bar_widget.dart';

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
        endDrawer: constraints.maxWidth >= AppSizes.desktopSize
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
            if (constraints.maxWidth >= AppSizes.desktopSize)
              DesktopTopNavBarWidget()
            else
              MobileTopNavBarWidget(
                iconPressed: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),

            if (constraints.maxWidth >= AppSizes.desktopSize)
              MainDashboardDesktopWidget()
            else
              MainDashboardMobileWidget(),

            //skill
SkillDesktop(screenWidth: screenWidth),
            Container(height: 500, width: double.infinity),
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
