import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/data/model/clientsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hovering/hovering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class MyFooter extends StatelessWidget {
  MyFooter({super.key});
  final List footerImgs = [
    "assets/images/x.png",
    "assets/images/insta.png",
    "assets/images/fb.png",
  ];
  final List SocialLinks = [
    "https://twitter.com/Mcc8ashAlbna",
    "https://www.instagram.com/ealbnaa/",
    "https://www.facebook.com/profile.php?id=61555734955962",
  ];
  
  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);
    final List navigatorsScreen = [
    S.of(context).Main,
    S.of(context).About,
    S.of(context).OurClients,
    S.of(context).Portfolio,
    S.of(context).OurServices,
    S.of(context).ContactUs,
  ];
    final List<ClientsModel> contactData = [
    ClientsModel(
        image: "assets/images/phone.png",
        description: "+966 560031111 -  920004768"),
    ClientsModel(
        image: "assets/images/letter.png", description: "info@ModernCo.com"),
    ClientsModel(
        image: "assets/images/map.png",
        description: S.of(context).Address),
  ];

  final List<ClientsModel> contactData2 = [
    ClientsModel(
        image: "assets/images/phone.png",
        description: "+966 560031111 -  920004768"),
    ClientsModel(
        image: "assets/images/letter.png", description: "info@ModernCo.com"),
    ClientsModel(
        image: "assets/images/map.png",
        description: S.of(context).AddressPhone),
  ];
    return BlocBuilder<BrokerCubit, BrokerStates>(builder: (context, state) {
      return ResponsiveVisibility(
        visible: false,
        visibleWhen: const [
          Condition.largerThan(name: MOBILE),
          Condition.largerThan(name: TABLET),
        ],
        replacement: Container(
          // padding: EdgeInsets.symmetric(horizontal: 55),
          color: const Color(0xff272333),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // height: 400,
          child: Column(
            children: [
              // Row
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 18.0, bottom: 18, right: 18),
                      child: SizedBox(
                        width: 400,
                        child: Column(
                          
                          children: [
                            //logo
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: () {
                                  cubit.selectAppBar(0,0);
                                },
                                child: Image.asset(
                                  "assets/images/logoDark.png",
                                  width: 200,
                                  height: 100,
                                ),
                              ),
                            ),
                            // logo text
                            const SizedBox(
                              height: 13,
                            ),
                            //social icons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                footerImgs.length,
                                (index) => InkWell(
                                  onTap: () async{
                                              final Uri url = Uri.parse(SocialLinks[index]);
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(url);
                                              } else {
                                                throw 'Could not launch the link';
                                              }
                                            },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: HoverWidget(
                                      onHover: (event) {},
                                      hoverChild: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          color: primaryC4,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            footerImgs[index],
                                            width: 8,
                                                      height: 8,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          // color: Colors.white,
                                          border: Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            footerImgs[index],
                                            width: 8,
                                            height: 8,
                                            // fit: BoxFit.fill,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: defaultText(
                                  S.of(context).SocialLinks, 20, FontWeight.w400,
                                  color: primaryC4),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  List.generate(contactData2.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          // color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Image.asset(
                                            contactData2[index].image,

                                            // width: 8,
                                            // height: 8,
                                            fit: BoxFit.fitHeight,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: defaultText(
                                              contactData2[index].description,
                                              14,
                                              FontWeight.w500,
                                              color: Colors.white)),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ]),
                    ),

                    Center(child: Padding(
                              padding: const EdgeInsets.fromLTRB(8,20,8,0),
                              child: defaultText(
                                  S.of(context).ShortLinks, 20, FontWeight.w400,
                                  color: primaryC4),
                            ),),
                    
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: List.generate(
                                  navigatorsScreen.length, (index) {
                                return InkWell(
                                  onTap: () {
                                    cubit.selectAppBar(index,0);
                                  },
                                  child: HoverWidget(
                                    hoverChild: Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(8,8,3,8),
                                            child: defaultText(
                                                "${navigatorsScreen[index]}",
                                                16,
                                                FontWeight.w500,
                                                color: primaryC3)),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 17,
                                          color: primaryC3,
                                        )
                                      ],
                                    ),
                                    onHover: (event) {},
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(8,8,3,8),
                                        child: defaultText(
                                            "${navigatorsScreen[index]}",
                                            16,
                                            FontWeight.w500,
                                            color: Colors.white)),
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                    
                  ]),
              const SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      // padding: const EdgeInsets.all(50)
                      color: Colors.white,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          defaultText(
                              S.of(context).CopyRights,
                              8,
                              FontWeight.w400,
                              color: Colors.white),
                          const Spacer(),
                          Row(
                            children: [
                              defaultText(S.of(context).MadeInAman, 8, FontWeight.w400,
                                  color: Colors.white),
                              // SizedBox(
                              //   width: 3,
                              // ),
                              Image.asset(
                                "assets/images/aman.png",
                                width: 10,
                                height: 10,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 55),
          color: const Color(0xff272333),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // height: 400,
          child: Column(
            children: [
              //////////////When smaller//////////////////
              MediaQuery.of(context).size.width < 1200
                  ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                                padding: const EdgeInsets.symmetric(vertical: 18),
                                child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: InkWell(
                                          onTap: () {
                                            cubit.selectAppBar(0,0);
                                          },
                                          child: Image.asset(
                                            "assets/images/logoDark.png",
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(
                                          footerImgs.length,
                                          (index) => InkWell(
                                            onTap: () async{
                                              final Uri url = Uri.parse(SocialLinks[index]);
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(url);
                                              } else {
                                                throw 'Could not launch the link';
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: HoverWidget(
                                                onHover: (event) {},
                                                hoverChild: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: const BoxDecoration(
                                                    color: primaryC4,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Image.asset(
                                                      footerImgs[index],
                                                      width: 8,
                                                      height: 8,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    // color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Image.asset(
                                                      footerImgs[index],
                                                      width: 8,
                                                      height: 8,
                                                      // fit: BoxFit.fill,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:CrossAxisAlignment.center,
                                          children: List.generate(
                                              contactData.length, (index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 35,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Image.asset(
                                                        contactData[index].image,
                      
                                                        // width: 8,
                                                        // height: 8,
                                                        fit: BoxFit.fitHeight,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(8),
                                                      child: defaultText(
                                                          contactData[index]
                                                              .description,
                                                          16,
                                                          FontWeight.w500,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      
                                    ],
                                  ),
                                
                              ),
                      ])
                  :
                  //-----------------When Bigger than 1000
                  Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: WrapCrossAlignment.start,
                          // alignment: WrapAlignment.spaceEvenly,
                          children: [
                              //SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                              
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 18),
                                child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: InkWell(
                                          onTap: () {
                                            cubit.selectAppBar(0,0);
                                          },
                                          child: Image.asset(
                                            "assets/images/logoDark.png",
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(
                                          footerImgs.length,
                                          (index) => InkWell(
                                            onTap: () async{
                                              final Uri url = Uri.parse(SocialLinks[index]);
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(url);
                                              } else {
                                                throw 'Could not launch the link';
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: HoverWidget(
                                                onHover: (event) {},
                                                hoverChild: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: const BoxDecoration(
                                                    color: primaryC4,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Image.asset(
                                                      footerImgs[index],
                                                      width: 8,
                                                      height: 8,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    // color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Image.asset(
                                                      footerImgs[index],
                                                      width: 8,
                                                      height: 8,
                                                      // fit: BoxFit.fill,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                          //crossAxisAlignment:CrossAxisAlignment.start,
                                          children: List.generate(
                                              contactData.length, (index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 35,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Image.asset(
                                                        contactData[index].image,
                      
                                                        // width: 8,
                                                        // height: 8,
                                                        fit: BoxFit.fitHeight,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(8),
                                                      child: defaultText(
                                                          contactData[index]
                                                              .description,
                                                          16,
                                                          FontWeight.w500,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      
                                    ],
                                  ),
                                
                              ),
                              
                              /*Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(8,8,16,8),
                                            child: defaultText(
                                                "روابط مختصرة", 20, FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                          Row(
                                            
                                            //padding: EdgeInsets.zero,
                                            //physics: const NeverScrollableScrollPhysics(),
                                            //shrinkWrap: true,
                                            children: List.generate(
                                                cubit.navigatorsScreen.length, (index) {
                                              return InkWell(
                                                onTap: () {
                                                  // cubit.mainScreenName[index];
                                                  cubit.selectAppBar(index);
                                                        
                                                  // cubit.mainScreenName[index];
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 8),
                                                  child: HoverWidget(
                                                    hoverChild: Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets.all(8),
                                                            child: defaultText(
                                                                "${cubit.navigatorsScreen[index]}",
                                                                16,
                                                                FontWeight.w500,
                                                                color: primaryC3)),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        const Icon(
                                                          Icons.arrow_forward,
                                                          size: 17,
                                                          color: primaryC3,
                                                        )
                                                      ],
                                                    ),
                                                    onHover: (event) {},
                                                    child: Padding(
                                                        padding: const EdgeInsets.all(8),
                                                        child: defaultText(
                                                            "${cubit.navigatorsScreen[index]}",
                                                            16,
                                                            FontWeight.w500,
                                                            color: Colors.white)),
                                                  ),
                                                ),
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                  ),*/
                            
                              /*Padding(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: defaultText(
                                              "وسائل التواصل", 20, FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                        Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: List.generate(
                                              contactData.length, (index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 35,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Image.asset(
                                                        contactData[index].image,
                      
                                                        // width: 8,
                                                        // height: 8,
                                                        fit: BoxFit.fitHeight,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(8),
                                                      child: defaultText(
                                                          contactData[index]
                                                              .description,
                                                          16,
                                                          FontWeight.w500,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ]),
                                
                              ),
                              */
                            ]),
              const SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      // padding: const EdgeInsets.all(50)
                      color: Colors.white,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          defaultText(
                              S.of(context).CopyRights,
                              10,
                              FontWeight.w400,
                              color: Colors.white),
                          const Spacer(),
                          Row(
                            children: [
                              defaultText(S.of(context).MadeInAman, 14, FontWeight.w400,
                                  color: Colors.white),
                              const SizedBox(
                                width: 3,
                              ),
                              Image.asset("assets/images/aman.png")
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
