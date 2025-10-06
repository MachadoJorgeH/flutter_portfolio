import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/styles/style.dart';
import 'package:my_portifolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 50,
            margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
            decoration: kHeaderDecoration,
            child: Row(
              children: [
                SiteLogo(onTap: onLogoTap,
                ),
                Spacer(),
                IconButton(onPressed: onMenuTap, icon: Icon(Icons.menu,)),
                Gap(15),
              ],
            ),
          );
  }
}