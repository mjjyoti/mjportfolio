import 'package:flutter/material.dart';
import 'package:mjportfolio/constants/color.dart';
import 'package:mjportfolio/constants/size.dart';
import 'package:mjportfolio/utils/project_utils.dart';
import 'package:mjportfolio/widgets/contact_section.dart';
import 'package:mjportfolio/widgets/custom_text_field.dart';
import 'package:mjportfolio/widgets/drawer_mobile.dart';
import 'package:mjportfolio/widgets/footer.dart';
import 'package:mjportfolio/widgets/header_desktop.dart';
import 'package:mjportfolio/widgets/header_mobile.dart';
import 'package:mjportfolio/widgets/main_desktop.dart';
import 'package:mjportfolio/widgets/main_mobile.dart';
import 'package:mjportfolio/widgets/project_section.dart';
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
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

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
            : DrawerMobile(
                onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                key: navbarKeys.first,
              ),
              //HEADER
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
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
                key: navbarKeys[1],
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
              ProjectSection(
                key: navbarKeys[2],
              ),

              //CONTACTS
              ContactSection(
                key: navbarKeys[3],
              ),
              //FOOTER
              Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(microseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
