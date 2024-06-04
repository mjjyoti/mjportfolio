import 'package:flutter/material.dart';
import 'package:mjportfolio/constants/color.dart';
import 'package:mjportfolio/constants/nav_items.dart';
import 'package:mjportfolio/styles/style.dart';
import 'package:mjportfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({super.key});

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        width: double.maxFinite,
        decoration: kHeaderDecoration,
        child: Row(
          children: [
            SiteLogo(onTap: () {}),
            const Spacer(),
            for (int i = 0; i < navTitles.length; i++)
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    navTitles[i],
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.whitePrimary),
                  ),
                ),
              )
          ],
        ));
  }
}
