import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mjportfolio/constants/color.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.2,
      constraints: BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //intro msg
              const Text(
                "Hi,\nI'm Jyoti Mahajan\nA Flutter Developer",
                style: TextStyle(
                    fontSize: 30.0,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whitePrimary),
              ),
              SizedBox(
                height: 15,
              ),

              //contact btn
              SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Get in touch")),
              )
            ],
          ),
          Image.asset(
            "assets/dash.png",
            width: screenWidth / 2,
          )
        ],
      ),
    );
  }
}
