import 'dart:convert';

import 'package:company_profile/constants.dart';
import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/data/model/clientsModel.dart';
import 'package:company_profile/home/data/model/serviceModel.dart';
import 'package:company_profile/home/data/model/workModel.dart';
import 'package:company_profile/home/presentation/widgets/ReadMore/readMore_body.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/title_description..dart';
import 'package:company_profile/home/presentation/widgets/footer.dart';
import 'package:company_profile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:hovering/hovering.dart';
import 'package:responsive_framework/responsive_framework.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'widgets/differentWidgets/defaultTextField.dart';
import 'widgets/previous_work/previousWork_item.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
// import 'package:flutter_mailer/flutter_mailer.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String selectedService = isArabic() ? "بدون خدمة" : "None";
  bool validate_done = false;
  int statusCode = -1;
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);

    final List<ServiceModel> distinguishList = [
        ServiceModel(
          serviceTitle: S.of(context).Apart1,
          serviceDescription:
              S.of(context).Apart1Desc,
          image: "assets/images/crown.png",
          textLeft: false,
        ),
        ServiceModel(
          serviceTitle: S.of(context).Apart2,
          serviceDescription: S.of(context).Apart2Desc,
          image: "assets/images/reward.png",
          textLeft: false,
        ),
        ServiceModel(
          serviceTitle: S.of(context).Apart3,
          serviceDescription:
              S.of(context).Apart3Desc,
          image: "assets/images/investment.png",
          textLeft: false,
        ),
        ServiceModel(
          serviceTitle: S.of(context).Apart4,
          serviceDescription:
              S.of(context).Apart4Desc,
          image: "assets/images/retention.png",
          textLeft: false,
        ),
      ];

    final List<ServiceModel> serviceList = [
        ServiceModel(
          serviceTitle: S.of(context).Service1,
          serviceDescription:S.of(context).Service1Desc,
          image: "assets/images/1.png",
          textLeft: false,
        ),
        ServiceModel(
            serviceTitle: S.of(context).Service2,
          serviceDescription:S.of(context).Service2Desc,
            image: "assets/images/2.png",
            textLeft: true),
        ServiceModel(
            serviceTitle: S.of(context).Service3,
          serviceDescription:S.of(context).Service3Desc,
            image: "assets/images/3.png",
            textLeft: false),
        ServiceModel(
            serviceTitle: S.of(context).Service4,
          serviceDescription:S.of(context).Service4Desc,
            image: "assets/images/4.png",
            textLeft: true),
      ];

    final List<WorkModel> worklist = [
        WorkModel(
            workType: S.of(context).WorkType1,
            workTitle: S.of(context).Work1,
            workDescription: S.of(context).Work1Desc,
            image: 'assets/images/w1-1.jpg'),
        WorkModel(
            workType: S.of(context).WorkType2,
            workTitle: S.of(context).Work2,
            workDescription: S.of(context).Work2Desc,
            image: 'assets/images/w2-1.jpg'),
        WorkModel(
            workType: S.of(context).WorkType1,
            workTitle: S.of(context).Work3,
            workDescription: S.of(context).Work3Desc,
            image: 'assets/images/w3-1.jpg'),
        WorkModel(
            workType: S.of(context).WorkType1,
            workTitle: S.of(context).Work4,
            workDescription: S.of(context).Work4Desc,
            image: 'assets/images/w4-1.jpg'),
        ];
        
    final List<ClientsModel> clientsList = [
        ClientsModel(
            image: "assets/images/client1.png",
            description: S.of(context).Client1
                ),
        ClientsModel(
            image: "assets/images/client2.png",
            description: S.of(context).Client2
            ),
        ClientsModel(
            image: "assets/images/client3.png",
            description: S.of(context).Client3
            ),
        ClientsModel(
            image: "assets/images/client4.png",
            description: S.of(context).Client4
            ),
        ClientsModel(
            image: "assets/images/client5.png",
            description: S.of(context).Client5
            ),
      ];

    final List<String> serviceListForm = [S.of(context).None,S.of(context).Service1,S.of(context).Service2,S.of(context).Service3,S.of(context).Service4];
    
    return BlocBuilder<BrokerCubit, BrokerStates>(
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            
            Stack(alignment: Alignment.center, children: [
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
                  image: const AssetImage(
                    "assets/images/ksa.png",
                  ),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                ),
              ),
              ResponsiveVisibility(
                visible: false,
                visibleWhen: const [
                  Condition.largerThan(name: MOBILE),
                  Condition.largerThan(name: TABLET)
                ],
                //----------Mobile&Tablet----------
                replacement: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultText(S.of(context).SpecialistsInContracting, 20, FontWeight.w200,
                        height: 1, color: primaryC4),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      S.of(context).MCC,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: "Alexandria",
                          fontWeight: FontWeight.w200,
                          fontSize: 30,
                          height: 1.5,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        S.of(context).MCC_Desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 18,
                            height: 1.5,
                            fontFamily: "Alexandria",
                            color: Color.fromARGB(250, 255, 255, 255)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 38,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom().copyWith(
                          shape: MaterialStateProperty.resolveWith<
                              RoundedRectangleBorder>(
                            (states) {
                              if (states.contains(MaterialState.hovered)) {
                                return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color: Color(0xffD19026)));
                              }
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white));
                            },
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (states) {
                              if (states.contains(MaterialState.hovered)) {
                                return const Color(0xffD19026);
                              }
                              return const Color.fromARGB(28, 255, 255, 255);
                            },
                          ),
                        ),
                        onPressed: () {
                          cubit.selectAppBar(1,0);
                        },
                        child: Text(
                          S.of(context).ReadMore,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                    // ,SizedBox(height: 20,)
                  ],
                ),
                //----------WEB-----------
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).SpecialistsInContracting,
                      style: const TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 24,
                          ////////////////
                          fontFamily: "Alexandria",
                          color: primaryC4),
                    ),
                    Text(
                      S.of(context).MCC,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 40,
                          height: 1.8,
                          fontFamily: "Alexandria",
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        S.of(context).MCC_Desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            height: 1.8,
                            fontFamily: "Alexandria",
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      height: 38,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom().copyWith(
                          shape: MaterialStateProperty.resolveWith<
                              RoundedRectangleBorder>(
                            (states) {
                              if (states.contains(MaterialState.hovered)) {
                                return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color: Color(0xffD19026)));
                              }
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white));
                            },
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (states) {
                              if (states.contains(MaterialState.hovered)) {
                                return const Color(0xffD19026);
                              }
                              return const Color.fromARGB(28, 255, 255, 255);
                            },
                          ),
                        ),
                        onPressed: () {
                          cubit.selectAppBar(1,0);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) {
                          //     return ReadMoreScreen();
                          //   },
                          // ));
                        },
                        child: Text(
                          S.of(context).ReadMore,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: "Alexandria",
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            const ReadMoreBody(),
            const SizedBox(
              height: 30,
            ),
            //------------------
            ///Responsive distinguish part
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: ResponsiveVisibility(
                visible: false,
                visibleWhen: const [
                  Condition.largerThan(name: MOBILE),
                  Condition.largerThan(name: TABLET)
                ],
                replacement: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Image.asset("assets/images/distinguish.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TitleAndDescriptionWidget(
                          title: S.of(context).WhatSetsUsApart,
                          description:
                              S.of(context).WhatSetsUsApartDesc),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: isArabic() ? 15 : 0,left: isArabic() ? 0 : 15),
                      child: SizedBox(
                        height: isArabic() ? 170 : 190,
                        child: ListView.builder(
                          itemCount: distinguishList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(right: 12,left: 12,bottom: 20),
                              child: Container(
                                width: isArabic() ? 230 : 240,
                                // height: ,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: primaryC7,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      distinguishList[index].image,
                                      width: 50,
                                      height: 50,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      distinguishList[index].serviceTitle,
                                      style: const TextStyle(
                                          fontFamily: "Alexandria",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: primaryC3),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: 230,
                                      child: Text(
                                        distinguishList[index]
                                            .serviceDescription,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: "Alexandria",
                                            fontSize: 9,
                                            fontWeight: FontWeight.w100,
                                            color: basicC3,
                                            height: 1.8),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                //----------web
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: TitleAndDescriptionWidget(
                                  title: S.of(context).WhatSetsUsApart,
                                  description:
                                      S.of(context).WhatSetsUsApartDesc)),
                          const Spacer(),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .3,
                              child:
                                  Image.asset("assets/images/distinguish.png"))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: isArabic() ? MediaQuery.of(context).size.width*0.075 : MediaQuery.of(context).size.width*0.025),
                      child: SizedBox(
                        height: isArabic() ? 200 : 230,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true, overscroll: true),
                          child: ListView.builder(
                            //physics: const PageScrollPhysics(),

                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 20,left: 20,bottom: 20),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: primaryC7,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        distinguishList[index].image,
                                        width: 65,
                                        height: 65,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      defaultText(
                                          distinguishList[index].serviceTitle,
                                          15,
                                          FontWeight.w200,
                                          color: primaryC3),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: isArabic() ? 260 : 300,
                                        child: Text(
                                          distinguishList[index]
                                              .serviceDescription,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              height: 1.8,
                                              fontFamily: "Alexandria",
                                              fontWeight: FontWeight.w100,
                                              color: basicC2),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 280,
                                      //   child: defaultText(
                                      //       distinguishList[index]
                                      //           .serviceDescription,
                                      //       12,

                                      //       FontWeight.w100,
                                      //       color: basicC2,
                                      //       textAlign: TextAlign.center
                                      //       ),
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //------------------

            const SizedBox(
              height: 15,
            ),
            //Responsive services
            ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: MOBILE),
                Condition.largerThan(name: TABLET)
              ],
              replacement: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defaultText(S.of(context).OurServices, 36, FontWeight.w400, color: const Color(0xffA5702A)),
                    InkWell(
                        onTap: () {
                          cubit.selectAppBar(4,0);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: isArabic() ? 0 : 5),
                          child: SizedBox(
                              height: 35,
                              width: 165,
                              child: HoverWidget(
                                hoverChild: Container(
                                  decoration: BoxDecoration(
                                      color: primaryC4,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        S.of(context).ViewServices,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: "Alexandria",
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200),
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
                                      border: Border.all(color: Colors.black),
                                      // color: primaryC4,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        S.of(context).ViewServices,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: "Alexandria",
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ////
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        // childAspectRatio: 5 / 6.6,
                        // maxCrossAxisExtent: 400,
                        maxCrossAxisExtent: 405,
                        childAspectRatio: 5 / 6.4,

                        // mainAxisExtent: 410
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: serviceList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            cubit.selectAppBar(9,index);
                          },
                          child: HoverWidget(
                            onHover: (event) {},
                            hoverChild: Container(
                              padding: const EdgeInsets.only(bottom: 25),
                              decoration: BoxDecoration(
                                color: primaryC5,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.asset(
                                      serviceList[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  defaultText(serviceList[index].serviceTitle,
                                      20, FontWeight.w400,
                                      height: 1.5, color: primaryC2),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      serviceList[index].serviceDescription,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          height: 1.5,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: "Alexandria",
                                          color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        S.of(context).SeeMore,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: "Alexandria",
                                            color: primaryC2),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: primaryC2,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 25),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.asset(
                                      serviceList[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  defaultText(serviceList[index].serviceTitle,
                                      20, FontWeight.w400,
                                      height: 1.5, color: primaryC4),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      serviceList[index].serviceDescription,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          height: 1.5,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: "Alexandria",
                                          color: basicC3),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        S.of(context).SeeMore,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: "Alexandria",
                                            color: primaryC5),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: primaryC5,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              //-----------web
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defaultText(S.of(context).OurServices, 40, FontWeight.w400, color: const Color(0xffA5702A)),
                          InkWell(
                              onTap: () {
                                cubit.selectAppBar(4,0);
                              },
                              child: SizedBox(
                                  height: 35,
                                  width: 165,
                                  child: HoverWidget(
                                    hoverChild: Container(
                                      decoration: BoxDecoration(
                                          color: primaryC4,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            S.of(context).ViewServices,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
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
                                          border: Border.all(color: Colors.black),
                                          // color: primaryC4,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            S.of(context).ViewServices,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    GridView.builder(
                      gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                          childAspectRatio: 5 / 7,
                          maxCrossAxisExtent: 350,
                          mainAxisExtent: MediaQuery.of(context).size.width > 1000 ? 420 : 400
                          ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: serviceList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            cubit.selectAppBar(9,index);
                          },
                          child: HoverWidget(
                            onHover: (event) {},
                            hoverChild: Container(
                              padding:
                                  const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: primaryC5,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.asset(
                                      serviceList[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  defaultText(serviceList[index].serviceTitle,
                                      20, FontWeight.w400,
                                      height: 1.5, color: primaryC2),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      serviceList[index].serviceDescription,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          height: 1.5,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: "Alexandria",
                                          color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        S.of(context).SeeMore,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: "Alexandria",
                                            color: primaryC2),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: primaryC2,
                                        size: 12,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                            child: Container(
                              height: 200,
                              padding:
                                  const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.asset(
                                      serviceList[index].image,
                                      // width: 280,
                                      // width: MediaQuery.of(context).size.width * .2,
                                      // // height: 230,
                                      // height:
                                      //     MediaQuery.of(context).size.height * .4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  defaultText(serviceList[index].serviceTitle,
                                      20, FontWeight.w400,
                                      height: 1.5, color: primaryC4),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 12),
                                    // height:
                                    //     MediaQuery.of(context).size.height * .16,
                                    // width: MediaQuery.of(context).size.width * .2,
                                    child: Text(
                                      serviceList[index].serviceDescription,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          height: 1.5,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: "Alexandria",
                                          color: basicC3),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        S.of(context).SeeMore,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: "Alexandria",
                                            color: primaryC5),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: primaryC5,
                                        size: 12,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            //------------------
            const SizedBox(height: 30),

            //responsive work
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              //////////////Responsive services
              child: ResponsiveVisibility(
                visible: false,
                visibleWhen: const [
                  Condition.largerThan(name: MOBILE),
                  Condition.largerThan(name: TABLET)
                ],
                replacement: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              // width: MediaQuery.of(context).size.width * .5,
                              child: TitleAndDescriptionWidget(
                                  title: S.of(context).Portfolio,
                                  description:
                                      S.of(context).PortfolioDesc)),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: InkWell(
                              onTap: () {
                                cubit.selectAppBar(3,0);
                              },
                              child: SizedBox(
                                  height: 35,
                                  width: 190,
                                  child: HoverWidget(
                                    hoverChild: Container(
                                      decoration: BoxDecoration(
                                          color: primaryC4,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            S.of(context).ViewAllWorks,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
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
                                          border:
                                              Border.all(color: Colors.black),
                                          // color: primaryC4,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            S.of(context).ViewAllWorks,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: isArabic() ? 15 : 0, left: isArabic() ? 0 : 15),
                      child: SizedBox(
                        height: 250,
                        // width: 300,
                        child: ListView.builder(
                          itemCount: worklist.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,20),
                              child: SizedBox(
                                // color: Colors.amber,
                                width: 250,
                                child: PreviousWorkItem(
                                  cubit: cubit,
                                  image: worklist[index].image,
                                  workType: worklist[index].workType!,
                                  workTitle: worklist[index].workTitle,
                                  workDescription:
                                      worklist[index].workDescription,
                                      index: index,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                //------------web
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .6,
                              child: TitleAndDescriptionWidget(
                                  title: S.of(context).Portfolio,
                                  description:
                                      S.of(context).PortfolioDesc
                                      )),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: InkWell(
                              onTap: () {
                                cubit.selectAppBar(3,0);
                              },
                              child: SizedBox(
                                  height: 35,
                                  width: 190,
                                  child: HoverWidget(
                                    hoverChild: Container(
                                      decoration: BoxDecoration(
                                          color: primaryC4,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            S.of(context).ViewAllWorks,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
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
                                          border:
                                              Border.all(color: Colors.black),
                                          // color: primaryC4,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            S.of(context).ViewAllWorks,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: isArabic() ? 40 : 0, left: isArabic() ? 0 : 40),
                      child: SizedBox(
                        height: 250,
                        // width: 300,
                        child: ListView.builder(
                          itemCount: worklist.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,20),
                              child: SizedBox(
                                // color: Colors.amber,
                                width: 350,
                                child: PreviousWorkItem(
                                  cubit: cubit,
                                  image: worklist[index].image,
                                  workType: worklist[index].workType!,
                                  workTitle: worklist[index].workTitle,
                                  workDescription:
                                      worklist[index].workDescription,
                                      index: index,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            //------------------
            Column(
              children: [
                ResponsiveVisibility(
                  visible: false,
                  visibleWhen: const [
                    Condition.largerThan(name: MOBILE),
                    Condition.largerThan(name: TABLET)
                  ],
                  replacement: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            // width: MediaQuery.of(context).size.width * .5,
                            child: TitleAndDescriptionWidget(
                                title: S.of(context).OurClients2,
                                description:
                                    S.of(context).ClientsDesc)),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: InkWell(
                            onTap: () {
                              cubit.selectAppBar(2,0);
                            },
                            child: SizedBox(
                                height: 35,
                                width: 190,
                                child: HoverWidget(
                                  hoverChild: Container(
                                    decoration: BoxDecoration(
                                        color: primaryC4,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          S.of(context).ViewAllPartners,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: "Alexandria",
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200),
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
                                        border: Border.all(color: Colors.black),
                                        // color: primaryC4,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          S.of(context).ViewAllPartners,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: "Alexandria",
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///////////////web
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: TitleAndDescriptionWidget(
                                title: S.of(context).OurClients2,
                                description:
                                    S.of(context).ClientsDesc)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: InkWell(
                            onTap: () {
                              cubit.selectAppBar(2,0);
                            },
                            child: SizedBox(
                                height: 35,
                                width: 190,
                                child: HoverWidget(
                                  hoverChild: Container(
                                    decoration: BoxDecoration(
                                        color: primaryC4,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          S.of(context).ViewAllPartners,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: "Alexandria",
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200),
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
                                        border: Border.all(color: Colors.black),
                                        // color: primaryC4,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          S.of(context).ViewAllPartners,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: "Alexandria",
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ResponsiveVisibility(
                  visibleWhen: const [
                    Condition.largerThan(name: MOBILE),
                    Condition.largerThan(name: TABLET)
                  ],
                  visible: false,
                  replacement: Padding(
                    padding: EdgeInsets.only(right: isArabic() ? 15 : 0, left: isArabic() ? 0 : 15),
                    child: SizedBox(
                      height: 240,
                      // width: 300,
                      child: ListView.builder(
                        itemCount: clientsList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              // color: Colors.amber,
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 130,
                                    width: 240,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    child: Image.asset(
                                      clientsList[index].image,
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 220,
                                      // height: ,
                                      child: Center(
                                          child: Text(
                                        clientsList[index].description,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: "Alexandria",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: primaryC2),
                                      )))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: isArabic() ? 40 : 0, left: isArabic() ? 0 : 30),
                    child: SizedBox(
                      height: 240,
                      // width: 300,
                      child: ListView.builder(
                        itemCount: clientsList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              // color: Colors.amber,
                              width: 280,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 140,
                                    width: 260,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    child: Image.asset(
                                      clientsList[index].image,
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 230,
                                      // height: ,
                                      child: Center(
                                          child: Text(
                                        clientsList[index].description,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: "Alexandria",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: primaryC2),
                                      )))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 15),

            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ResponsiveVisibility(
                visibleWhen: const [
                  Condition.largerThan(name: MOBILE),
                  Condition.largerThan(name: TABLET)
                ],
                visible: false,
                replacement: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      // width: 300,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SizedBox(
                              child: Image.asset(
                                "assets/images/lightLogo.png",
                                // width: 300,
                                width: MediaQuery.of(context).size.width * .9,

                                // MediaQuery.of(context).size.width * .3,

                                // height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                              // width: 400,
                              // width: MediaQuery.of(context).size.width * .32,

                              width: MediaQuery.of(context).size.width * .9,
                              child: Text(
                                S.of(context).MCC_Desc,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: basicC3,
                                    height: 1.8,
                                    fontFamily: "Alexandria"),
                              )
                              //  defaultText(
                              //   "احدى الشركات الرائدة فى اعمال المقاولات والبناء الحديث فى المملكة العربية السعودية",
                              //   20,
                              //   FontWeight.w500,
                              //   color: basicC3,
                              //   textAlign: TextAlign.center,
                              // ),
                              )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .96,

                      // width: 500,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: primaryC7,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          // width: MediaQuery.of(context).size.width * .45,
                          // width: 500,
                          // width: MediaQuery.of(context).size.width * .8,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: defaultText(
                                      S.of(context).ContactUs, 28, FontWeight.w600,
                                      color: primaryC3),
                                ),
                                Form(
                                  key: _formKey,
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: nameController,
                                          prefix: const Icon(Icons.person),
                                          labelText: S.of(context).Name),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: phoneController,
                                          prefix: const Icon(Icons.phone_enabled),
                                          labelText: S.of(context).Phone),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: emailController,
                                          prefix: const Icon(Icons.email),
                                          labelText: S.of(context).Email),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                      child: DropdownButtonFormField<String>(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      value: serviceListForm[0],
                                      
                                      items: List.generate(serviceListForm.length, (index) =>
                                      DropdownMenuItem<String>(
                                        value: serviceListForm[index],
                                        child: Text(serviceListForm[index]),
                                      ),
                                      ),
                                      onChanged: (value) {
                                        selectedService = value.toString();
                                      },
                                      decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      //suffixIcon: suffix,
                                      focusColor: primaryC3,
                                      labelText: S.of(context).Service,
                                      labelStyle: const TextStyle(fontSize: 14, fontFamily: "Alexandria"),
                                      prefixIcon: const Icon(Icons.all_inbox_outlined),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)
                                            // color: primaryC3
                                            ),
                                      ),
                                      errorStyle: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)),
                                      ),
                                      hoverColor: Colors.white,
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: primaryC3),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)),
                                      ),
                                                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                        controller: messageController,
                                        labelText: S.of(context).Message,
                                        maxLines: 6,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: InkWell(
                                        onTap: () async{
                                          final http.Response response;
                                          if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

                                          response = await http.post(
                                            url,
                                            headers: {
                                              'origin': 'http://localhost',
                                              'Content-Type': 'application/json',
                                            },
                                            body: json.encode({
                                              'service_id': 'service_t6f4bnl',
                                              'template_id': 'template_i3t487i',
                                              'user_id': 'Ic2DzVtFaiORvvn8A',
                                              'template_params': {
                                                'user_subject': isArabic() ? "طلب جديد" : "New Request",

                                                'title': isArabic() ? "طلب جديد من موقع شركة البناء الحديث" : "New Request from MCC Website",

                                                'user_data_label': isArabic() ? "بيانات العميل:" : "The Client Data:",
                                                
                                                'name_label': S.of(context).Name,
                                                'user_name': nameController.text,

                                                'email_label': S.of(context).Email,
                                                'user_email': emailController.text,
                                                
                                                'phone_label': S.of(context).Phone,
                                                'user_phone': phoneController.text,

                                                'service_label': S.of(context).Service,
                                                'user_service': selectedService,
                                                
                                                'message_label': S.of(context).Message,
                                                'user_message': messageController.text,
                                              },
                                            }),
                                          );
                                          statusCode = response.statusCode;
                                          validate_done = true;
                                          }
                                          
                                          if(validate_done)
                                          {
                                            if(statusCode == 200)
                                            {
                                              nameController.text = " ";
                                            emailController.text = " ";
                                            phoneController.text = " ";
                                            messageController.text = " ";
                                            showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(isArabic() ? "تم إرسال رسالتك بنجاح!" : "Your Message has been sent Successfully!",
                                                  style: const TextStyle(
                                                      fontFamily: "Alexandria"),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color.fromARGB(255, 39, 35, 51),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15)),
                                                        ),
                                                        child: Text(
                                                          isArabic() ? "حسناً" : "Okay",
                                                          style: const TextStyle(
                                                            fontFamily:"Alexandria",
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)),
                                              );
                                            });
                                          
                                            }
                                            else{
                                              showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(isArabic() ? "حدث خطأ! كود الحالة: $statusCode - حاول مرة أخرى" : "Error Occurred! Status Code: $statusCode - Try again",
                                                  style: const TextStyle(
                                                      fontFamily: "Alexandria"),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color.fromARGB(255, 39, 35, 51),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15)),
                                                        ),
                                                        child: Text(
                                                          isArabic() ? "حسناً" : "Okay",
                                                          style: const TextStyle(
                                                            fontFamily:"Alexandria",
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)),
                                              );
                                            });
                                          
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: primaryC4),
                                          child: Center(
                                              child: Text(
                                            S.of(context).Submit,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20),
                                          )),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                              ]),
                        ),
                      ),
                    ),
                  ],
                )
                /////////////////////
                ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,

                      // width: 500,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        //color: primaryC7,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          // width: MediaQuery.of(context).size.width * .45,
                          // width: 500,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: defaultText(
                                      S.of(context).ContactUs, 28, FontWeight.w600,
                                      color: primaryC3),
                                ),
                                Form(
                                  
                                  key: _formKey,
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: nameController,
                                          prefix: const Icon(Icons.person),
                                          labelText: S.of(context).Name),
                                    ),
                                    Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 6,
                                                        horizontal: 4),
                                                child: DefaultTextField(
                                                    controller: phoneController,
                                                    prefix: const Icon(
                                                        Icons.phone_enabled),
                                                    labelText: S.of(context).Phone),
                                              ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: emailController,
                                          prefix: const Icon(Icons.email),
                                          labelText: S.of(context).Email),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                      child: DropdownButtonFormField<String>(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      value: serviceListForm[0],
                                      
                                      items: List.generate(serviceListForm.length, (index) =>
                                      DropdownMenuItem<String>(
                                        value: serviceListForm[index],
                                        child: Text(serviceListForm[index]),
                                      ),
                                      ),
                                      onChanged: (value) {
                                        selectedService = value.toString();
                                      },
                                      decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      //suffixIcon: suffix,
                                      focusColor: primaryC3,
                                      labelText: S.of(context).Service,
                                      labelStyle: const TextStyle(fontSize: 14, fontFamily: "Alexandria"),
                                      prefixIcon: const Icon(Icons.all_inbox_outlined),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)
                                            // color: primaryC3
                                            ),
                                      ),
                                      errorStyle: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)),
                                      ),
                                      hoverColor: Colors.white,
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: primaryC3),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)),
                                      ),
                                                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                        controller: messageController,
                                        labelText: S.of(context).Message,
                                        maxLines: 6,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: InkWell(
                                        onTap: () async {
                                          final http.Response response;
                                          if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

                                          response = await http.post(
                                            url,
                                            headers: {
                                              'origin': 'http://localhost',
                                              'Content-Type': 'application/json',
                                            },
                                            body: json.encode({
                                              'service_id': 'service_t6f4bnl',
                                              'template_id': 'template_i3t487i',
                                              'user_id': 'Ic2DzVtFaiORvvn8A',
                                              'template_params': {
                                                'user_subject': isArabic() ? "طلب جديد" : "New Request",

                                                'title': isArabic() ? "طلب جديد من موقع شركة البناء الحديث" : "New Request from MCC Website",

                                                'user_data_label': isArabic() ? "بيانات العميل:" : "The Client Data:",
                                                
                                                'name_label': S.of(context).Name,
                                                'user_name': nameController.text,

                                                'email_label': S.of(context).Email,
                                                'user_email': emailController.text,
                                                
                                                'phone_label': S.of(context).Phone,
                                                'user_phone': phoneController.text,

                                                'service_label': S.of(context).Service,
                                                'user_service': selectedService,
                                                
                                                'message_label': S.of(context).Message,
                                                'user_message': messageController.text,
                                              },
                                            }),
                                          );
                                          statusCode = response.statusCode;
                                          validate_done = true;
                                          }
                                          
                                          if(validate_done)
                                          {
                                            if(statusCode == 200)
                                            {
                                              nameController.text = " ";
                                            emailController.text = " ";
                                            phoneController.text = " ";
                                            messageController.text = " ";
                                            showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(isArabic() ? "تم إرسال رسالتك بنجاح!" : "Your Message has been sent Successfully!",
                                                  style: const TextStyle(
                                                      fontFamily: "Alexandria"),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color.fromARGB(255, 39, 35, 51),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15)),
                                                        ),
                                                        child: Text(
                                                          isArabic() ? "حسناً" : "Okay",
                                                          style: const TextStyle(
                                                            fontFamily:"Alexandria",
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)),
                                              );
                                            });
                                          
                                            }
                                            else{
                                              showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(isArabic() ? "حدث خطأ! كود الحالة: $statusCode - حاول مرة أخرى" : "Error Occurred! Status Code: $statusCode - Try again",
                                                  style: const TextStyle(
                                                      fontFamily: "Alexandria"),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color.fromARGB(255, 39, 35, 51),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15)),
                                                        ),
                                                        child: Text(
                                                          isArabic() ? "حسناً" : "Okay",
                                                          style: const TextStyle(
                                                            fontFamily:"Alexandria",
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)),
                                              );
                                            });
                                          
                                            }
                                          }

                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: primaryC4),
                                          child: Center(
                                              child: Text(
                                            S.of(context).Submit,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20),
                                          )
                                              // child: defaultText(, 20,
                                              //     FontWeight.w400,
                                              //     color: Colors.white),
                                              ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                              ]),
                        ),
                      ),
                    ),

                    SizedBox(
                      // width: 300,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SizedBox(
                              child: Image.asset(
                                "assets/images/lightLogo.png",
                                // width: 300,
                                width: MediaQuery.of(context).size.width * .3,

                                // height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                              // width: 400,
                              width: MediaQuery.of(context).size.width * .32,
                              child: Text(
                                S.of(context).MCC_Desc,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: basicC3,
                                    height: 1.8,
                                    fontFamily: "Alexandria"),
                              )

                              // child: defaultText(
                              //   "احدى الشركات الرائدة فى اعمال المقاولات والبناء الحديث فى المملكة العربية السعودية",
                              //   20,
                              //   FontWeight.w500,
                              //   color: basicC3,
                              //   textAlign: TextAlign.center,
                              // ),
                              )
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            
            MyFooter()
          ],
        ),
      ),
    );
  }
}
