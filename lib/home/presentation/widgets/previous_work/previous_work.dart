// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/model/workModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/title_description..dart';
import 'package:company_profile/home/presentation/widgets/navBar/content_navbar.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/text_overImage.dart';

import '../../../../constants.dart';
import '../footer.dart';
import 'previousWork_item.dart';

class PreviousWorkBody extends StatelessWidget {
  const PreviousWorkBody({
    Key? key,
    // required this.withFooter,
  }) : super(key: key);
// final  bool withFooter;

  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);
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
    return BlocBuilder<BrokerCubit, BrokerStates>(
      builder: (context, state) => ResponsiveVisibility(
        visible: false,
        visibleWhen: const [
          Condition.largerThan(name: MOBILE),
          Condition.largerThan(name: TABLET)
        ],
        replacement: SingleChildScrollView(
          child: Column(
            children: [
              TextOverImage(
                  title: S.of(context).Portfolio,
                  subTitle: "",
                  image: "assets/images/previous_workbg.png"),
              ContentNavBar(
                  navcontent: Row(
                children: [
                  /*InkWell(
                    onTap: () {
                      cubit.selectAppBar(11);
                      ///////////////
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: defaultText("اعمالنا", 12, FontWeight.w500,
                          color: basicC4),
                    ),
                  ),
                  defaultText("/", 12, FontWeight.w500, color: basicC4),*/
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: defaultText(S.of(context).ViewAllWorks, 12, FontWeight.w500,
                        color: primaryC2),
                  ),
                ],
              ), shadowAppear: true,),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:
                    // PreviousWorkBody()
                    Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndDescriptionWidget(
                      title: S.of(context).Portfolio,
                      description:
                          S.of(context).PortfolioDesc,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 5 / 4.9,
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * .9,
                      ),
                      children: List.generate(worklist.length, (index) {
                        return PreviousWorkItem(
                          cubit: cubit,
                          image: worklist[index].image,
                          workType: worklist[index].workType!,
                          workTitle: worklist[index].workTitle,
                          workDescription: worklist[index].workDescription,
                          index: index,
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              // withFooter ? MyFooter() : Container()
              MyFooter()
            ],
          ),
        ),
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextOverImage(
                  title: S.of(context).Portfolio,
                  subTitle: "",
                  image: "assets/images/previous_workbg.png"),
              ContentNavBar(
                  navcontent: Row(
                children: [
                  /*InkWell(
                    onTap: () {
                      cubit.selectAppBar(11);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: defaultText("اعمالنا", 16, FontWeight.w500,
                          color: basicC4),
                    ),
                  ),*/
                  //defaultText("/", 16, FontWeight.w500, color: basicC4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: defaultText(S.of(context).ViewAllWorks, 16, FontWeight.w500,
                        color: primaryC2),
                  ),
                ],
              ), shadowAppear: true,),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child:
                    // PreviousWorkBody()
                    Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        /////////////////
                      },
                      child: defaultText(S.of(context).Portfolio, 42, FontWeight.w400,
                          color: primaryC3),
                    ),
                    defaultText(
                        S.of(context).PortfolioDesc,
                        18,
                        FontWeight.w500,
                        color: primaryC2),
                    const SizedBox(
                      height: 30,
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 18.0,
                        mainAxisSpacing: 18.0,
                        childAspectRatio: 5 / 4,

                        // crossAxisCount: 4,
                        // crossAxisSpacing: 15,
                        // childAspectRatio: 5 / 4,

                        // mainAxisSpacing: 15, maxCrossAxisExtent: 400,
                      ),
                      children: List.generate(worklist.length, (index) {
                        return PreviousWorkItem(
                          cubit: cubit,
                          image: worklist[index].image,
                          workType: worklist[index].workType!,
                          workTitle: worklist[index].workTitle,
                          workDescription: worklist[index].workDescription,
                          index: index
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              // withFooter ? MyFooter() : Container()

              MyFooter()
            ],
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
