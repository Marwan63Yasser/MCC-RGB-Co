import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../constants.dart';

class TitleAndDescriptionWidget extends StatelessWidget {
  const TitleAndDescriptionWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
        Condition.largerThan(name: TABLET),
      ],
      replacement: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultText(title, 36, FontWeight.w400, color: const Color(0xffA5702A)),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: defaultText(description, 18, FontWeight.w500,
                color: primaryC2),
            ),
          ),
        ],
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultText(title, 40, FontWeight.w400, color: const Color(0xffA5702A)),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: defaultText(description, 18, FontWeight.w500,
                color: primaryC2),
            ),
          ),
        ],
      ),
    );
  }
}
