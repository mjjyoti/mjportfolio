import 'package:flutter/cupertino.dart';
import 'package:mjportfolio/widgets/project_card.dart';

import '../constants/color.dart';
import '../utils/project_utils.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Container(
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
    );
  }
}
