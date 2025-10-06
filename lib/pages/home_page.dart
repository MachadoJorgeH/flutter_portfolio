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
                    Text('What I can do', style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary
                    )),
                    Gap(20),

                    //plataforms and skills
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //platforms
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 450,
                          ),
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
                                  // border: Border.all(color: CustomColor.whitePrimary),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  leading: Image.asset(platformItems[i]['img'], width: 26,),
                                  title: Text(platformItems[i]['title']),
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(50),

                        //skills
                        Flexible(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 500
                            ),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                for (int i = 0; i < skillItems.length; i++)
                                Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: CustomColor.whitePrimary),
                                    // borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Chip(
                                    backgroundColor: CustomColor.bgLight2,
                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                    label: Text(skillItems[i]['title']),
                                    avatar: Image.asset(skillItems[i]['img'], width: 26),),
                                ),
                                  
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),


              //Projects
              Container(height: 500, width: double.maxFinite),
              //Contacts
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
              //Footer
              Container(height: 500, width: double.maxFinite),
            ],
          ),
        );
      },
    );
  }
}
