import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/model/visionAndValueModel.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/title_description..dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:timelines/timelines.dart';

import '../../../../constants.dart';

class HowWeWorkBody extends StatelessWidget {
  const HowWeWorkBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VisionValueModel> workList = [
    VisionValueModel(
        pointName: S.of(context).Vision1,
        pointText: S.of(context).Vision1Desc,
        ),
    VisionValueModel(
        pointName: S.of(context).Vision2,
        pointText: S.of(context).Vision2Desc,
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
                  // SizedBox(
                  //   height: 25,
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Image.asset(
                            "assets/images/how_we_workc.png",
                            // width: 500,
                            // height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TitleAndDescriptionWidget(
                    title: S.of(context).howDoWeWork,
                    description: S.of(context).howDoWeWorkDesc,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ///////////////
                  Timeline.tileBuilder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    theme: TimelineTheme.of(context).copyWith(
                        ///////dot position
                        indicatorPosition: 0.20,
                        nodePosition: 0,
                        color: const Color(0xffA5702A),
                        connectorTheme:
                            const ConnectorThemeData(color: Color(0xffE0B555))),
                    builder: TimelineTileBuilder.connected(
                      itemCount: workList.length,
                      contentsBuilder: (context, index) {
                        return TimelineTile(
                          nodePosition: 0,
                          nodeAlign: TimelineNodeAlign.basic,
                          node: TimelineNode(
                            indicator:
                                const OutlinedDotIndicator(color: Color(0xffA5702A)),
                            startConnector:
                                index == 0 ? Container() : const SolidLineConnector(),
                            endConnector: index == workList.length - 1
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
                                text: workList[index].pointName,
                                style: const TextStyle(
                                    fontFamily: "Alexandria",
                                    color: primaryC3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.8),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: workList[index].pointText,
                                    style: const TextStyle(
                                      height: 1.8,
                                      fontFamily: "Alexandria",
                                      color: basicC2,
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
              height: 15,
            ),
          ],
        ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .45,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.asset(
                    "assets/images/how_we_workc.png",
                    width: 580,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleAndDescriptionWidget(
                  title: S.of(context).howDoWeWork,
                    description: S.of(context).howDoWeWorkDesc,
                  ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                          padding: const EdgeInsets.fromLTRB(0,8,0,8),
                          child: RichText(
                            text: TextSpan(
                              text:  workList[0].pointName,
                              style: const TextStyle(
                                  fontFamily: "Alexandria",
                                  color: primaryC3,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.8),
                              children: <TextSpan>[
                                TextSpan(
                                  text: workList[0].pointText,
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

              Padding(
                          padding: const EdgeInsets.fromLTRB(0,8,0,8),
                          child: RichText(
                            text: TextSpan(
                              text: workList[1].pointName,
                              style: const TextStyle(
                                  fontFamily: "Alexandria",
                                  color: primaryC3,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.8),
                              children: <TextSpan>[
                                TextSpan(
                                  text: workList[1].pointText,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
