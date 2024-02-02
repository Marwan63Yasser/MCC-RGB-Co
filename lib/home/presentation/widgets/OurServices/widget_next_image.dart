// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hovering/hovering.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../constants.dart';

class WidgetNextImage extends StatelessWidget {
  const WidgetNextImage({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.textLeft,
    required this.index
  }) : super(key: key);
  final String image;
  final String title;
  final String text;
  final bool textLeft;
  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);
    
    return BlocBuilder<BrokerCubit, BrokerStates>(
      builder: (context, state) => SingleChildScrollView(
            child: ResponsiveVisibility(
          visible: false,
          visibleWhen: const [
            Condition.largerThan(name: MOBILE),
            Condition.largerThan(name: TABLET),
          ],
          replacement: Column(
            children: [
              textLeft
                  ? SizedBox(
                      width: double.infinity,
                      child: Column(
                        // crossAxisAlignment: WrapCrossAlignment.start,
                        // alignment: WrapAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          /*Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                image,
                                // width: MediaQuery.of(context).size.width * .45,
                                // height: MediaQuery.of(context).size.height * .6,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),*/
                          // Spacer(),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 15),
                            // width: MediaQuery.of(context).size.width * .45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultText(title, 38, FontWeight.w400,
                                    color: primaryC3, height: 1.5),
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultText(text, 20, FontWeight.w500,
                                    color: basicC2),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.selectAppBar(9,index);
                                  },
                                  child: SizedBox(
                                      height: 38,
                                      width: 160,
                                      child: HoverWidget(
                                        hoverChild: Container(
                                          decoration: BoxDecoration(
                                              // border: Border.all(color: Colors.white),
                                              color: primaryC4,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                S.of(context).ServiceDetails,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontFamily: "Alexandria",
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 18,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                        onHover: (event) {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              // color: primaryC4,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                S.of(context).ServiceDetails,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontFamily: "Alexandria",
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Column(
                        // crossAxisAlignment: WrapCrossAlignment.start,
                        // alignment: WrapAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 15, right: 15, left: 15),
                            // width: MediaQuery.of(context).size.width * .45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultText(
                                  title,
                                  38,
                                  FontWeight.w400,
                                  color: const Color(0xffA5702A),
                                  height: 1.5,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultText(text, 18, FontWeight.w500,
                                    color: basicC2),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.selectAppBar(9,index);
                                  },
                                  child: SizedBox(
                                      height: 38,
                                      width: 160,
                                      child: HoverWidget(
                                        hoverChild: Container(
                                          decoration: BoxDecoration(
                                              // border: Border.all(color: Colors.white),
                                              color: primaryC4,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                S.of(context).ServiceDetails,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontFamily: "Alexandria",
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 18,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                        onHover: (event) {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              // color: primaryC4,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                S.of(context).ServiceDetails,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontFamily: "Alexandria",
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                          /*Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                image,
                                // width: MediaQuery.of(context).size.width * .45,
                                // height: MediaQuery.of(context).size.height * .6,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
            ],
          ),
          //--------WEB-----------------
          child: Column(
            children: [
              textLeft
                  ? SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          /*Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                image,
                                // width: 500,
                                // height: 400,
                                width: MediaQuery.of(context).size.width * .5,
                                // height: MediaQuery.of(context).size.height * .6,
                                height: 400,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),*/
                          // Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                            //width: MediaQuery.of(context).size.width * .4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                defaultText(title, 40, FontWeight.w400,
                                    color: primaryC3, height: 1),
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultText(text, 20, FontWeight.w500,
                                    color: basicC2),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.selectAppBar(9,index);
                                  },
                                  child: SizedBox(
                                      height: 38,
                                      width: 160,
                                      child: HoverWidget(
                                        hoverChild: Container(
                                          decoration: BoxDecoration(
                                              // border: Border.all(color: Colors.white),
                                              color: primaryC4,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                S.of(context).ServiceDetails,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontFamily: "Alexandria",
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 18,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                        onHover: (event) {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              // color: primaryC4,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                S.of(context).ServiceDetails,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontFamily: "Alexandria",
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        // alignment: WrapAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                            //width: MediaQuery.of(context).size.width * .4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                defaultText(
                                  title,
                                  40,
                                  FontWeight.w400,
                                  color: const Color(0xffA5702A),
                                  height: 1,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultText(text, 20, FontWeight.w500,
                                    color: basicC2),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.selectAppBar(9,index);
                                  },
                                  child: SizedBox(
                                      height: 38,
                                      width: 160,
                                      child: HoverWidget(
                                        hoverChild: Container(
                                          decoration: BoxDecoration(
                                              // border: Border.all(color: Colors.white),
                                              color: primaryC4,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                S.of(context).ServiceDetails,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontFamily: "Alexandria",
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 18,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                        onHover: (event) {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              // color: primaryC4,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                S.of(context).ServiceDetails,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontFamily: "Alexandria",
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                          /*Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                image,
                                width: MediaQuery.of(context).size.width * .5,
                                // height: MediaQuery.of(context).size.height * .6,
                                height: 400,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),**/
                        
                        ],
                      ),
                    ),
            ],
          ),
        )),
    );
  }
}
