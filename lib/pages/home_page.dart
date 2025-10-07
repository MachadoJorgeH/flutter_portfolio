import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/constants/nav_items.dart';
import 'package:my_portifolio/constants/size.dart';
import 'package:my_portifolio/constants/skill_items.dart';
import 'package:my_portifolio/styles/style.dart';
import 'package:my_portifolio/widgets/drawer_mobile.dart';
import 'package:my_portifolio/widgets/header_desktop.dart';
import 'package:my_portifolio/widgets/header_mobile.dart';
import 'package:my_portifolio/widgets/main_desktop.dart';
import 'package:my_portifolio/widgets/main_mobile.dart';
import 'package:my_portifolio/widgets/site_logo.dart';

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

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer:
              constraints.maxWidth >= kMinDesktopWidth
                  ? null
                  : const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //Main
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop()
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (constraints.maxWidth >= kMinDesktopWidth)
                MainDesktop()
              else
                MainMobile(),

              //SKILLS
              Container(
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
                                // Define o número de colunas com base na largura disponível
                                int crossAxisCount;
                                if (constraints.maxWidth < 450) {
                                  crossAxisCount = 2; // Telas muito pequenas
                                } else if (constraints.maxWidth < 700) {
                                  crossAxisCount = 3; // Telas pequenas/médias
                                } else {
                                  crossAxisCount = 4; // Telas largas
                                }

                                return GridView.count(
                                  crossAxisCount: crossAxisCount,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio:
                                      3.5, // Ajusta a proporção do chip, pode precisar de ajuste
                                  // Essencial para usar GridView dentro de um SingleChildScrollView
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
              ),

              //Projects
              Container(
                height: 500,
                width: double.maxFinite,
                child: Text('Projects'),
              ),
              //Contacts
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
                child: Text('Contacts'),
              ),
              //Footer
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.redAccent,
                child: Text('Footer'),
              ),
            ],
          ),
        );
      },
    );
  }
}
