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
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                leading: Image.asset(
                  platformItems[i]['img'],
                  width: 26,
                ),
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          final crossAxisCount = availableWidth <= 390 ? 2 : 4;
          
          return GridView.count(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(skillItems.length, (i) {
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: CustomColor.bgLight2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      skillItems[i]['img'],
                      width: 28,
                      height: 28,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.code,
                          color: CustomColor.whitePrimary,
                          size: 28,
                        );
                      },
                    ),
                    const Gap(8),
                    Text(
                      skillItems[i]['title'],
                      style: const TextStyle(
                        color: CustomColor.whitePrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}