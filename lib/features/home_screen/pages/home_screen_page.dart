import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_colors.dart';
import 'package:portfolio_website/core/constants/app_enum.dart';
import 'package:portfolio_website/core/constants/app_sizes.dart';
import 'package:portfolio_website/features/home_screen/widgets/skill_desktop.dart';

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
  final scrollController = ScrollController();
  final List<GlobalKey> navKeys = List.generate(4, (index) => GlobalKey());
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
                    controller: scrollController,
                    scrollDirection: Axis.vertical,

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
                          onTap: () {
                            scaffoldKey.currentState?.closeEndDrawer();
                            scrollToSection(i);
                          },
                          leading: Icon(navItemIcon[i]),
                          title: Text(navItemList[i]),
                        ),
                    ],
                  ),
                ),
              ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: Column(
            children: [
              SizedBox(key: navKeys.first),
              //top nav button
              if (constraints.maxWidth >= AppSizes.desktopMinSize)
                DesktopTopNavBarWidget(
                  onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
              else
                MobileTopNavBarWidget(
                  iconPressed: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),

              if (constraints.maxWidth >= AppSizes.desktopMinSize)
                MainDashboardDesktopWidget(
                  onHireMeTap: () => scrollToSection(3),
                )
              else
                MainDashboardMobileWidget(
                  onHireMeTap: () => scrollToSection(3),
                ),

              //skill
              if (constraints.maxWidth >= AppSizes.desktopMediumSize)
                SkillDesktop(screenWidth: screenWidth, key: navKeys[1])
              else
                SkillMobile(screenWidth: screenWidth, key: navKeys[1]),

              //project
              ProjectsSection(screenWidth: screenWidth, key: navKeys[2]),
              ContactMeWidget(screenWidth: screenWidth, key: navKeys[3],maxWidth: constraints.maxWidth,),
            ],
          ),
        ),
      ),
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a blog page
      return;
    }
    final key = navKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
