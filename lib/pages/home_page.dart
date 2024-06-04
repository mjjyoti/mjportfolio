import 'package:flutter/material.dart';
import 'package:mjportfolio/constants/color.dart';
import 'package:mjportfolio/constants/size.dart';
import 'package:mjportfolio/utils/project_utils.dart';
import 'package:mjportfolio/widgets/drawer_mobile.dart';
import 'package:mjportfolio/widgets/header_desktop.dart';
import 'package:mjportfolio/widgets/header_mobile.dart';
import 'package:mjportfolio/widgets/main_desktop.dart';
import 'package:mjportfolio/widgets/main_mobile.dart';
import 'package:mjportfolio/widgets/skills_desktop.dart';
import 'package:mjportfolio/widgets/skills_mobile.dart';

import '../widgets/project_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffolfBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : const DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //HEADER
            if (constraints.maxWidth >= kMinDesktopWidth)
              const HeaderDesktop()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
            //MAIN
            if (constraints.maxWidth >= kMinDesktopWidth)
              const MainDesktop()
            else
              const MainMobile(),
            //SKILLS
            Container(
              color: CustomColor.bgLight1,
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  const Text(
                    "What I can do",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //platform and skills
                  if (constraints.maxWidth >= kMedDesktopWidth)
                    const SkillsDesktop()
                  else
                    const SkillsMobile(),
                ],
              ),
            ),

            //PROJECTS
            Container(
              color: CustomColor.bgLight1,
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  const Text(
                    "Work Projects",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Wrap(
                      runSpacing: 25,
                      spacing: 25,
                      children: [
                        for (int i = 0; i < workProjectUtils.length; i++)
                          ProjectCardWidget(
                              screenWidth: screenWidth,
                              project: workProjectUtils[i])
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //CONTACTS
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            ),

            //FOOTER
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            )
          ],
        ),
      );
    });
  }
}
