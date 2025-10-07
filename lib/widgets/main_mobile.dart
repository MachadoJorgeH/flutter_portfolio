import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
      height: screenHeight,
      constraints: BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.3,
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(
              'assets/avatar_portfolio_1.png',
              fit: BoxFit.contain,
              width: screenWidth,
            ),
          ),
          Gap(30),
          Text(
            "Hi,\nI'm Jorge Machado\nA Flutter Developer",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          Gap(15),
          SizedBox(
            width: screenWidth * 0.6,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Get in touch'),
            ),
          ),
        ],
      ),
    );
  }
}
