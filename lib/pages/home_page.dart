import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/constants/nav_items.dart';
import 'package:my_portifolio/constants/size.dart';
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
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
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
