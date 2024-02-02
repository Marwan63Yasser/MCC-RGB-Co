// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

import '../../../../constants.dart';

class TextOverImage extends StatelessWidget {
  const TextOverImage({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 39, 35, 51),
                    Color.fromARGB(36, 39, 35, 51),
                    Color.fromARGB(15, 39, 35, 51),
                    Color.fromARGB(3, 39, 35, 51),
                  ],
                )),
            child: Image(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height*0.55,
                alignment: Alignment.center,
              ),
          ),
          
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [
              Condition.largerThan(name: MOBILE),
              Condition.largerThan(name: TABLET),
            ],
            replacement: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontFamily: "Alexandria",
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontSize: 30),
                  )
                  // defaultText(title, 48, FontWeight.w100, color: Colors.white),
                  ,
                  const SizedBox(
                    height: 10,
                  ),
                  defaultText(subTitle, 25, FontWeight.w400,
                      color: const Color(0xffE0B555)),
                ],
              ),
            ),
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontFamily: "Alexandria",
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontSize: 40),
                  )
                  // defaultText(title, 48, FontWeight.w100, color: Colors.white),
                  ,
                  const SizedBox(
                    height: 15,
                  ),
                  defaultText(subTitle, 30, FontWeight.w400,
                      color: const Color(0xffE0B555)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
