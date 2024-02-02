import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/presentation/widgets/navBar/content_navbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../constants.dart';
import 'footer.dart';
import 'HowWeWork/how_we_work_body.dart';
import 'ReadMore/readMore_body.dart';
import 'differentWidgets/text_overImage.dart';
import 'visionAndValue/vision_body.dart';

class AboutCompanyScreen extends StatelessWidget {
  const AboutCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            TextOverImage(
                title: S.of(context).About,
                subTitle: S.of(context).AboutDesc,
                image: "assets/images/ksa.png"),

            //Responsive Content Navbar
            ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: MOBILE),
                Condition.largerThan(name: TABLET),
              ],
              replacement: ContentNavBar(
                  navcontent: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: defaultText(S.of(context).About, 12, FontWeight.w500,
                    color: primaryC2),
              ), shadowAppear: true,),
              child: ContentNavBar(
                  navcontent: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: defaultText(S.of(context).About, 16, FontWeight.w500,
                    color: primaryC2),
              ), shadowAppear: true,),
            ),
            const SizedBox(
              height: 30,
            ),
            const ReadMoreBody(),
            const SizedBox(
              height: 40,
            ),
            Container(
                padding: const EdgeInsets.only(top: 18, bottom: 40),
                color: Colors.white,
                child: const HowWeWorkBody()),
            const SizedBox(
              height: 40,
            ),
            const VisionAndValueBody(),
            const SizedBox(
              height: 40,
            ),
            MyFooter()
          ],
          // )
        ),
      );
  }
}
