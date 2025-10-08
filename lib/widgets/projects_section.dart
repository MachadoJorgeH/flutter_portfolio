import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/utils/project_utils.dart';
import 'package:my_portifolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // Work projects title
          const Text(
            'Work Projects',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const Gap(50),

          // Work projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCardWidget(project: workProjectUtils[i]),
              ],
            ),
          ),

          const Gap(50),

          // Hobby projects title
          const Text(
            'Hobby Projects',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const Gap(50),

          // Hobby projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyProjectUtils.length; i++)
                  ProjectCardWidget(project: hobbyProjectUtils[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}