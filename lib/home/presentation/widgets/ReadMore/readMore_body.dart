// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hovering/hovering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:timelines/timelines.dart';

import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';

import '../../../../constants.dart';
import '../differentWidgets/title_description..dart';


class ReadMoreBody extends StatefulWidget {
  const ReadMoreBody({super.key});

  @override
  State<ReadMoreBody> createState() => _ReadMoreBodyState();
}

bool showMore = false;


class _ReadMoreBodyState extends State<ReadMoreBody> {
  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);
    final List readMoreData = [
  S.of(context).WhoAreWeS1,
  S.of(context).WhoAreWeS2,
  S.of(context).WhoAreWeS3,
  S.of(context).WhoAreWeS4,
  S.of(context).WhoAreWeS5,
  S.of(context).WhoAreWeS6,
  ];
    return BlocBuilder<BrokerCubit, BrokerStates>(builder: (context, state) {
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
                      height: 25,
                    ),
                    TitleAndDescriptionWidget(
                      title: S.of(context).WhoAreWe,
                      description: S.of(context).WhoAreWeDesc,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        FixedTimeline.tileBuilder(
                          theme: TimelineTheme.of(context).copyWith(
                              ///////dot position
                              indicatorPosition: 0.17,
                              nodePosition: 0,
                              color: const Color(0xffA5702A),
                              connectorTheme:
                                  const ConnectorThemeData(color: Color(0xffE0B555))),
                          builder: TimelineTileBuilder.connectedFromStyle(
                            firstConnectorStyle: ConnectorStyle.transparent,
                            lastConnectorStyle: ConnectorStyle.transparent,
                            contentsAlign: ContentsAlign.basic,
                            connectionDirection: ConnectionDirection.after,
                            contentsBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: isArabic() ? 12 : 0, left: isArabic() ? 0 : 12,),
                                child: defaultText("${readMoreData[index]}", 13,
                                    FontWeight.w400,
                                    color: basicC2)),
                            connectorStyleBuilder: (context, index) {
                              return ConnectorStyle.solidLine;
                            },
                            indicatorStyleBuilder: (context, index) {
                              return IndicatorStyle.outlined;
                            },
                            itemCount: showMore ? readMoreData.length : 3,
                            itemExtent: isArabic() ? 90.0 : 95.0,
                          ),
                        ),
                        !showMore
                            ? Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                // top: 0,
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 1.5, sigmaY: 1.5),
                                    child: SizedBox(
                                      // the size where the blurring starts
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.14,
                                      // color: Colors.black.withOpacity(0.1),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  showMore = !showMore;
                                                });
                                              },
                                              child: defaultText(S.of(context).ReadMore,
                                                  16, FontWeight.w400,
                                                  color: primaryC3))),
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        "assets/images/logoStart.png",
                        // width: 500,
                        // height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      // width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.selectAppBar(6,0);
                            },
                            child: HoverWidget(
                              hoverChild: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffE0B555),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                height: 100,
                                // width: 240,
                                width: MediaQuery.of(context).size.width * .43,

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/innovation.png",
                                      width: 40,
                                      height: 40,
                                      color: Colors.white,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        defaultText(S.of(context).VisionANDValues, 14,
                                            FontWeight.w400,
                                            color: Colors.white),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        const Icon(Icons.arrow_forward,
                                            color: Colors.white)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              onHover: (event) {},
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                height: 100,
                                // width: 240,
                                width: MediaQuery.of(context).size.width * .43,

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/innovation.png",
                                      width: 40,
                                      height: 40,
                                      color: Colors.grey.shade400,
                                    ),
                                    defaultText(
                                        S.of(context).VisionANDValues, 14, FontWeight.w400)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              cubit.selectAppBar(7,0);
                            },
                            child: HoverWidget(
                              hoverChild: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffE0B555),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                height: 100,
                                width: MediaQuery.of(context).size.width * .43,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/worker.png",
                                      color: Colors.white,
                                      width: 40,
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        defaultText(
                                            S.of(context).howDoWeWork, 14, FontWeight.w400,
                                            color: Colors.white),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        const Icon(Icons.arrow_forward,
                                            color: Colors.white)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              onHover: (event) {},
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                height: 100,
                                // width: 240,
                                width: MediaQuery.of(context).size.width * .43,

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/worker.png",
                                      color: Colors.grey.shade400,
                                      width: 40,
                                      height: 40,
                                    ),
                                    defaultText(S.of(context).howDoWeWork, 14, FontWeight.w400)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 25,
                    // ),
                    TitleAndDescriptionWidget(
                        title: S.of(context).WhoAreWe,
                      description: S.of(context).WhoAreWeDesc,
                        ),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        FixedTimeline.tileBuilder(
                          theme: TimelineTheme.of(context).copyWith(
                              ///////dot position
                              indicatorPosition: 0.30,
                              nodePosition: 0,
                              color: const Color(0xffA5702A),
                              connectorTheme:
                                  const ConnectorThemeData(color: Color(0xffE0B555))),
                          builder: TimelineTileBuilder.connectedFromStyle(
                            firstConnectorStyle: ConnectorStyle.transparent,
                            lastConnectorStyle: ConnectorStyle.transparent,
                            contentsAlign: ContentsAlign.basic,
                            connectionDirection: ConnectionDirection.after,
                            contentsBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: isArabic() ? 12 : 0 , left: isArabic() ? 0 : 12),
                                child: defaultText("${readMoreData[index]}", isArabic() ? 14 : 13,
                                    FontWeight.w400,
                                    color: basicC2)),
                            connectorStyleBuilder: (context, index) {
                              return ConnectorStyle.solidLine;
                            },
                            indicatorStyleBuilder: (context, index) {
                              return IndicatorStyle.outlined;
                            },
                            itemCount: showMore ? readMoreData.length : 3,
                            itemExtent: 90.0,
                          ),
                        ),
                        !showMore
                            ? Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                // top: 0,
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 1.5, sigmaY: 1.5),
                                    child: SizedBox(
                                      // the size where the blurring starts
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.14,
                                      // color: Colors.black.withOpacity(0.1),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  showMore = !showMore;
                                                });
                                              },
                                              child: defaultText(S.of(context).ReadMore,
                                                  16, FontWeight.w400,
                                                  color: primaryC3))),
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                // width: MediaQuery.of(context).size.width * .45,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        "assets/images/logoStart.png",
                        width: MediaQuery.of(context).size.width * .45,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.selectAppBar(6,0);
                            },
                            child: HoverWidget(
                              hoverChild: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffE0B555),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                height: 100,
                                width: MediaQuery.of(context).size.width * .22,
                                // width: 240,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/innovation.png",
                                      width: 40,
                                      fit: BoxFit.cover,
                                      height: 40,
                                      color: Colors.white,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        defaultText(S.of(context).VisionANDValues, 14,
                                            FontWeight.w400,
                                            color: Colors.white),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        const Icon(Icons.arrow_forward,
                                            color: Colors.white)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              onHover: (event) {},
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                height: 100,
                                // width: 240,
                                width: MediaQuery.of(context).size.width * .22,

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/innovation.png",
                                      width: 40,
                                      height: 40,
                                      color: Colors.grey.shade400,
                                    ),
                                    defaultText(
                                        S.of(context).VisionANDValues, 14, FontWeight.w400)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              cubit.selectAppBar(7,0);
                            },
                            child: HoverWidget(
                              hoverChild: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffE0B555),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                height: 100,
                                // width: 240,
                                width: MediaQuery.of(context).size.width * .22,

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/worker.png",
                                      color: Colors.white,
                                      width: 40,
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        defaultText(
                                            S.of(context).howDoWeWork, 14, FontWeight.w400,
                                            color: Colors.white),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        const Icon(Icons.arrow_forward,
                                            color: Colors.white)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              onHover: (event) {},
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                height: 100,
                                // width: 240,
                                width: MediaQuery.of(context).size.width * .22,

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/worker.png",
                                      color: Colors.grey.shade400,
                                      width: 40,
                                      height: 40,
                                    ),
                                    defaultText(S.of(context).howDoWeWork, 14, FontWeight.w400)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
      );
    });
  }
}
