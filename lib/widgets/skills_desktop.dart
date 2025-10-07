import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    
    return Container(
                width: screenWidth,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    Text(
                      'What I can do',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    Gap(20),

                    //plataforms and skills
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //platforms
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 450),
                          child: Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                              for (int i = 0; i < platformItems.length; i++)
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: CustomColor.bgLight2,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    leading: Image.asset(
                                      platformItems[i]['img'],
                                      width: 26,
                                    ),
                                    title: Text(platformItems[i]['title'], style: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold),),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Gap(50),

                        //skills
                        Flexible(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 450),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                int crossAxisCount;
                                if (constraints.maxWidth < 450) {
                                  crossAxisCount = 2;
                                } else if (constraints.maxWidth < 700) {
                                  crossAxisCount = 3;
                                } else {
                                  crossAxisCount = 4;
                                }

                                return GridView.count(
                                  crossAxisCount: crossAxisCount,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio:
                                      3.5,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),

                                  children: List.generate(skillItems.length, (
                                    i,
                                  ) {
                                    return Chip(
                                      backgroundColor: CustomColor.bgLight2,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      label: Text(skillItems[i]['title'], style: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold),),
                                      avatar: Image.asset(
                                        skillItems[i]['img'],
                                        width: 26,
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
  }
}