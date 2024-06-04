import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/color.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      height: screenHeight,
      constraints: BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //avtar img
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffolfBg.withOpacity(0.6),
                CustomColor.scaffolfBg.withOpacity(0.6),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              "assets/dash.png",
              width: screenWidth,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //intro txt
          const Text(
            "Hi,\nI'm Jyoti Mahajan\nA Flutter Developer",
            style: TextStyle(
                fontSize: 24.0,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(
            height: 15,
          ),

          //contacy btn
          SizedBox(
            width: 190,
            child: ElevatedButton(
                onPressed: () {}, child: const Text("Get in touch")),
          )
        ],
      ),
    );
  }
}
