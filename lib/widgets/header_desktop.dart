import 'package:flutter/material.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/constants/nav_items.dart';
import 'package:my_portifolio/styles/style.dart';
import 'package:my_portifolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            width: double.maxFinite,
            decoration: kHeaderDecoration,
            child: Row(
              children: [
                SiteLogo(onTap: () {
                  
                },),
                Spacer(),
                for (int i = 0; i < navTitles.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(onPressed: (){}, child: Text(navTitles[i], style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whitePrimary,
                  ),)),
                )
              ],
            ),
          );
  }
}