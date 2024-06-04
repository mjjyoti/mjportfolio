import 'package:flutter/material.dart';
import 'package:mjportfolio/constants/color.dart';
import 'package:mjportfolio/utils/project_utils.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget(
      {super.key, required this.screenWidth, required this.project});

  final ProjectUtils project;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          //work projects title
          // const Text(
          //   "Work Projects",
          //   style: TextStyle(
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //       color: CustomColor.whitePrimary),
          // ),

          //work projects cards
          Container(
            clipBehavior: Clip.antiAlias,
            height: 280,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColor.bgLight2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  project.image,
                  height: 140,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                //title
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 15, 12, 12),
                  child: Text(
                    project.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ),
                //subtitle
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text(
                    project.subtitle,
                    style: TextStyle(
                      fontSize: 10,
                      color: CustomColor.whiteSecondary,
                    ),
                  ),
                ),
                const Spacer(),
                //footer
                Container(
                  color: CustomColor.bgLight1,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Available on : ",
                        style: TextStyle(
                          fontSize: 10,
                          color: CustomColor.yellowSecondary,
                        ),
                      ),
                      Spacer(),
                      if (project.iosLink != null)
                        InkWell(
                          onTap: () {
                            // js.context.callMethod("open", [project.iosLink]);
                          },
                          child: Image.asset(
                            "assets/apple.png",
                            width: 19,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                      if (project.androidLink != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: InkWell(
                            onTap: () {
                              // js.context
                              //     .callMethod("open", [project.androidLink]);
                            },
                            child: Image.asset(
                              "assets/android.png",
                              width: 19,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        ),
                      if (project.webLink != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: InkWell(
                            onTap: () {
                              // js.context.callMethod("open", [project.webLink]);
                            },
                            child: Image.asset(
                              "assets/web.png",
                              width: 19,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
