import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mjportfolio/constants/size.dart';
import 'package:mjportfolio/constants/sns_links.dart';
import '../constants/color.dart';
import 'custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return             Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      // width: double.maxFinite,
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          //title
          Text(
            "Get in Touuch",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary),
          ),

          SizedBox(
            height: 50,
          ),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700,
            maxHeight: 100),
            child: LayoutBuilder(builder: (context, constraints){
              if(constraints.maxWidth>=kMinDesktopWidth){
                return buildNameEmailFieldDesktop();
              }
              //else
                return buildNameEmailFieldMobile();
            }),
          ),
          SizedBox(
            height: 15,
          ),
          //message
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextField(
              hintText: "Your Message",
              maxLines: 15,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //send button
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Get in Touch")),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: Divider()),
          SizedBox(
            height: 15,
          ),
          //sns icon button links

          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    js.context.callMethod('open',[SnsLinks.github]);
                  },
                  child: Image.asset(
                    "assets/github.png",
                    width: 28,
                  )),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open',[SnsLinks.linkedin]);
                  },
                  child: Image.asset(
                    "assets/linkedin.png",
                    width: 28,
                  )),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open',[SnsLinks.gmail]);
                  },
                  child: Image.asset(
                    "assets/gmail (1).png",
                    width: 28,
                  )),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open',[SnsLinks.instagram]);
                  },
                  child: Image.asset(
                    "assets/instagram.png",
                    width: 28,
                  )),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open',[SnsLinks.facebook]);
                  },
                  child: Image.asset(
                    "assets/facebook.png",
                    width: 28,
                  )),
            ],
          )
        ],
      ),
    )
    ;
  }

  Row buildNameEmailFieldDesktop(){
    return Row(
      children: [
        //name
        Flexible(
            child: CustomTextField(
              hintText: "Your Name",
            )),
        SizedBox(
          width: 15,
        ),
        //email
        Flexible(
            child: CustomTextField(
              hintText: "Your Email",
            ))
      ],
    );
  }
}

Column buildNameEmailFieldMobile(){
  return Column(
    children: [
      //name
      Flexible(
          child: CustomTextField(
            hintText: "Your Name",
          )),
      SizedBox(
        height: 15,
      ),
      //email
      Flexible(
          child: CustomTextField(
            hintText: "Your Email",
          ))
    ],
  );
}