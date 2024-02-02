// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/model/clientsModel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

import 'package:company_profile/home/presentation/widgets/differentWidgets/title_description..dart';
import 'package:company_profile/home/presentation/widgets/footer.dart';
import 'package:company_profile/home/presentation/widgets/navBar/content_navbar.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/text_overImage.dart';

import '../../../../constants.dart';

class OurClientsBody extends StatelessWidget {
  const OurClientsBody({
    Key? key,
    // required this.withFooter,
  }) : super(key: key);

  // final bool withFooter;

  @override
  Widget build(BuildContext context) {
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
    return SingleChildScrollView(
        child: Column(
          children: [
            TextOverImage(
                title: S.of(context).OurClients,
                subTitle: "",
                image: "assets/images/our_clientsbg.png"),
            ContentNavBar(
                navcontent: Row(
              children: [
                ResponsiveVisibility(
                  visible: false,
                  visibleWhen: const [
                    Condition.largerThan(name: MOBILE),
                    Condition.largerThan(name: TABLET),
                  ],
                  replacement: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: defaultText(S.of(context).ViewAllPartners, 12, FontWeight.w500,
                        color: primaryC2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: defaultText(S.of(context).ViewAllPartners, 16, FontWeight.w500,
                        color: primaryC2),
                  ),
                ),
              ],
            ), shadowAppear: true,),
            const SizedBox(
              height: 20,
            ),

            ///responsive title & desc
            ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: MOBILE),
                Condition.largerThan(name: TABLET),
              ],
              replacement: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndDescriptionWidget(
                        title: S.of(context).OurClients2,
                        description: S.of(context).ClientsDesc
                        ),
                    const SizedBox(
                      height: 35,
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 4 / 5,
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * .6,
                      ),
                      children: List.generate(clientsList.length, (index) {
                        return SizedBox(
                          // height: double.infinity,
                          // width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32)),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
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
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),

              ////////////////// web version of clients grid items
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndDescriptionWidget(
                        title: S.of(context).OurClients2,
                        description: S.of(context).ClientsDesc
                        ),
                    const SizedBox(
                      height: 35,
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 18.0,
                        mainAxisSpacing: 18.0,
                        childAspectRatio: 5 / 4.5,
                        maxCrossAxisExtent: 260,
                      ),
                      children: List.generate(clientsList.length, (index) {
                        return SizedBox(
                          // height: double.infinity,
                          // width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 130,
                                width: 260,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32)),
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
                                  width: 240,
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
                        );
                        //  Container(
                        //   height: 100,
                        //   width: 100,
                        //   child:

                        //   Stack(
                        //     children: [
                        //       ClipRRect(
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(20),
                        //         ),
                        //         child: SizedBox(
                        //           height: double.infinity,
                        //           width: double.infinity,
                        //           child: Image.asset(
                        //             "assets/images/previous_workbg.png",
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.bottomCenter,
                        //         child: Container(
                        //           height: MediaQuery.of(context).size.height * 0.2,
                        //           width: double.infinity,
                        //           foregroundDecoration: BoxDecoration(
                        //             borderRadius: BorderRadius.only(
                        //                 bottomLeft: Radius.circular(20),
                        //                 bottomRight: Radius.circular(20)),
                        //             gradient: LinearGradient(
                        //               end: Alignment.topCenter,
                        //               begin: Alignment.bottomCenter,
                        //               colors: [
                        //                 Color.fromARGB(220, 39, 35, 51),
                        //                 Color.fromARGB(220, 39, 35, 51),
                        //                 Color.fromARGB(220, 39, 35, 51),
                        //                 Color.fromARGB(220, 39, 35, 51),
                        //                 Color.fromARGB(60, 39, 35, 51),
                        //                 Color.fromARGB(0, 39, 35, 51),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.all(15.0),
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           mainAxisAlignment: MainAxisAlignment.end,
                        //           children: [
                        //             defaultText("nnj", 10, FontWeight.w400,
                        //                 color: primaryC4),
                        //             SizedBox(
                        //               height: 5,
                        //             ),
                        //             defaultText("l,", 10, FontWeight.w400,
                        //                 color: Colors.white),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),

                        // );
                      }),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            MyFooter()
            // withFooter ? MyFooter() : Container()
          ],
        ),
        //   ),
      );
  }
}
