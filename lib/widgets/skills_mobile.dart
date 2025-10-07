import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
                width: screenWidth,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                decoration: BoxDecoration(
                  color: CustomColor.bgLight1,
                  borderRadius: BorderRadius.circular(20),
                ),
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
                    Column(
                      children: [
                        //platforms
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 450),
                          child: GridView.count(
                            crossAxisCount: 2,

                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2.8,

                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),

                            children: List.generate(platformItems.length, (i) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: CustomColor.bgLight2,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
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
                              );
                            }),
                          ),
                        ),
                        Gap(40),
                        //skills
                        Container(
                          constraints: const BoxConstraints(maxWidth: 450),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              int crossAxisCount;
                              if (constraints.maxWidth < 300) {
                                crossAxisCount = 2;
                              } else if (constraints.maxWidth < 450) {
                                crossAxisCount = 2;
                              } else {
                                crossAxisCount = 4;
                              }

                              return GridView.count(
                                crossAxisCount: crossAxisCount,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 3.5,

                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),

                                children: List.generate(skillItems.length, (i) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: CustomColor.bgLight2,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          skillItems[i]['img'],
                                          width: 22,
                                        ),
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
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
  }
}