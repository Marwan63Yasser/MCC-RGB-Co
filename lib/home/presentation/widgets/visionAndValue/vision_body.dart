import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/model/visionAndValueModel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:timelines/timelines.dart';

import '../../../../constants.dart';

class VisionAndValueBody extends StatelessWidget {
  const VisionAndValueBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VisionValueModel> visionList = [
    VisionValueModel(
      pointName: S.of(context).Value1,
      pointText:S.of(context).Value1Desc,
    ),
    VisionValueModel(
        pointName: S.of(context).Value2,
        pointText:S.of(context).Value2Desc,
        ),
    VisionValueModel(
      pointName: S.of(context).Value3,
      pointText:S.of(context).Value3Desc,
    ),
    VisionValueModel(
      pointName: S.of(context).Value4,
      pointText:S.of(context).Value4Desc,
      ),
  ];
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
        Condition.largerThan(name: TABLET),
      ],
      replacement: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // width: MediaQuery.of(context).size.width * .5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  defaultText(S.of(context).VisionANDValues, 28, FontWeight.w400,
                      color: const Color(0xffA5702A)),
                  const SizedBox(
                    height: 20,
                  ),
                  Timeline.tileBuilder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    theme: TimelineTheme.of(context).copyWith(
                        ///////dot position
                        indicatorPosition: 0.18,
                        nodePosition: 0,
                        color: const Color(0xffA5702A),
                        connectorTheme:
                            const ConnectorThemeData(color: Color(0xffE0B555))),
                    builder: TimelineTileBuilder.connected(
                      itemCount: visionList.length,
                      contentsBuilder: (context, index) {
                        return TimelineTile(
                          nodePosition: 0,
                          nodeAlign: TimelineNodeAlign.basic,
                          node: TimelineNode(
                            // indicator: DotIndicator(),
                            indicator:
                                const OutlinedDotIndicator(color: Color(0xffA5702A)),
                            startConnector:
                                index == 0 ? Container() : const SolidLineConnector(),
                            endConnector: index == visionList.length - 1
                                ? Container()
                                : const SolidLineConnector(),
                          ),
                          contents: Padding(
                            padding: index != 4
                                ? const EdgeInsets.all(8.0)
                                : const EdgeInsets.only(
                                    left: 8.0, right: 8, bottom: 8),
                            child: RichText(
                              text: TextSpan(
                                text: visionList[index].pointName,
                                style: const TextStyle(
                                    fontFamily: "Alexandria",
                                    color: primaryC3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.8),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: visionList[index].pointText,
                                    style: const TextStyle(
                                      height: 1.8,
                                      fontFamily: "Alexandria",
                                      color: Color(0xff333333),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.asset(
                      "assets/images/visionc.png",
                      // width: 500,
                      // height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      
      child: Padding(
        // textDirection: TextDirection.rtl,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .45,
              child: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultText(S.of(context).VisionANDValues, 40, FontWeight.w400,
                        color: const Color(0xffA5702A)),
                    const SizedBox(
                      height: 20,
                    ),
                    Timeline.tileBuilder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      theme: TimelineTheme.of(context).copyWith(
                          ///////dot position
                          indicatorPosition: 0.30,
                          nodePosition: 0,
                          color: const Color(0xffA5702A),
                          connectorTheme:
                              const ConnectorThemeData(color: Color(0xffE0B555))),
                      builder: TimelineTileBuilder.connected(
                        itemCount: visionList.length,
                        contentsBuilder: (context, index) {
                          return TimelineTile(
                            nodePosition: 0,
                            nodeAlign: TimelineNodeAlign.basic,
                            node: TimelineNode(
                              // indicator: DotIndicator(),
                              indicator: const OutlinedDotIndicator(
                                  color: Color(0xffA5702A)),
                              startConnector: index == 0
                                  ? Container()
                                  : const SolidLineConnector(),
                              endConnector: index == visionList.length - 1
                                  ? Container()
                                  : const SolidLineConnector(),
                            ),
                            contents: Padding(
                              padding: index != 4
                                  ? const EdgeInsets.all(8.0)
                                  : const EdgeInsets.only(
                                      left: 8.0, right: 8, bottom: 8),
                              child: RichText(
                                text: TextSpan(
                                  text: visionList[index].pointName,
                                  style: const TextStyle(
                                      fontFamily: "Alexandria",
                                      color: primaryC3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.8),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: visionList[index].pointText,
                                      style: const TextStyle(
                                        height: 1.8,
                                        fontFamily: "Alexandria",
                                        color: Color(0xff333333),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .45,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.asset(
                      "assets/images/visionc.png",
                      width: 580,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
