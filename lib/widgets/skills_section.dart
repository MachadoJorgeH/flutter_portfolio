import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/constants/skill_items.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          const Text(
            'What I can do',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const Gap(40),
          LayoutBuilder(
            builder: (context, constraints) {
              // bool useVerticalLayout = constraints.maxWidth < 768;

              return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 50,
                runSpacing: 40,
                
                children: [
                  _buildPlatformsSection(),

                  _buildSkillsGrid(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformsSection() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 450),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: [
          for (int i = 0; i < platformItems.length; i++)
            Container(
              width: 220,
              decoration: BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: Image.asset(platformItems[i]['img'], width: 26),
                title: Text(
                  platformItems[i]['title'],
                  style: const TextStyle(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 450),
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(skillItems.length, (i) {
          return Container(
            decoration: BoxDecoration(
              color: CustomColor.bgLight2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(skillItems[i]['img'], width: 22),
                const Gap(8),
                Text(
                  skillItems[i]['title'],
                  style: const TextStyle(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}