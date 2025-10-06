import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;


    return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: screenHeight / 1.2,
                constraints: BoxConstraints(minHeight: 350.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hi,\nI'm Jorge Machado\nA Flutter Developer", style: TextStyle(
                          fontSize: 30,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                          ),),
                          Gap(15),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(
                            onPressed: (){},
                             child: Text('Get in touch')
                             )
                             ),
                      ],
                    ),
                    SizedBox(
                      height: 450,
                      child: Image.asset(
                        'assets/avatar_portfolio_1.png',
                        width: screenWidth/2,
                        ),
                    )
                  ],
                ),
              );
  }
}