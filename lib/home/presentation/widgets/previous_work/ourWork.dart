import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hovering/hovering.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../constants.dart';
import '../../../data/model/workModel.dart';
import '../differentWidgets/title_description..dart';
import 'previousWork_item.dart';

class OurWorkScreen extends StatelessWidget {
  OurWorkScreen({super.key});
  final List<WorkModel> worklist = [
    WorkModel(
        workType: "سكني",
        workTitle: "المكرم/ سعيد عبداللة القحطانى",
        workDescription: "بمدينة الدمام على مساحة اجمالى 17,000 م2",
        image: 'assets/images/building1.png'),
    WorkModel(
        workType: "سكني",
        workTitle: "المكرم/ سعيد عبداللة القحطانى",
        workDescription: "بمدينة الدمام على مساحة اجمالى 17,000 م2",
        image: 'assets/images/building1.png'),
    WorkModel(
        workType: "سكني",
        workTitle: "المكرم/ سعيد عبداللة القحطانى",
        workDescription: "بمدينة الدمام على مساحة اجمالى 17,000 م2",
        image: 'assets/images/building2.png'),
    WorkModel(
        workType: "سكني",
        workTitle: "المكرم/ سعيد عبداللة القحطانى",
        workDescription: "بمدينة الدمام على مساحة اجمالى 17,000 م2",
        image: 'assets/images/building3.png'),
    WorkModel(
        workType: "سكني",
        workTitle: "المكرم/ سعيد عبداللة القحطانى",
        workDescription: "بمدينة الدمام على مساحة اجمالى 17,000 م2",
        image: 'assets/images/building4.png'),
    WorkModel(
        workType: "سكني",
        workTitle: "المكرم/ سعيد عبداللة القحطانى",
        workDescription: "بمدينة الدمام على مساحة اجمالى 17,000 م2",
        image: 'assets/images/building2.png'),
    WorkModel(
        workType: "سكني",
        workTitle: "المكرم/ سعيد عبداللة القحطانى",
        workDescription: "بمدينة الدمام على مساحة اجمالى 17,000 م2",
        image: 'assets/images/building3.png'),
    WorkModel(
        workType: "سكني",
        workTitle: "المكرم/ سعيد عبداللة القحطانى",
        workDescription: "بمدينة الدمام على مساحة اجمالى 17,000 م2",
        image: 'assets/images/building4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleAndDescriptionWidget(
                        title: "اعمالنا",
                        description:
                            "تقدم شركة البناء الحديث للمقاولات العامة خدمتها لتغطى مجموعه متنوعه من المشاريع المختلفة مثل : التجارية - السكنية - الترفيهية - التعليمية - الصناعية والبنية التحتية وغيرها"),
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
                            width: 165,
                            child: HoverWidget(
                              hoverChild: Container(
                                decoration: BoxDecoration(
                                    color: primaryC4,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "عرض جميع الاعمال",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Alexandria",
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    Icon(
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
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "عرض جميع الاعمال",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Alexandria",
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Icon(
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
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  height: 250,
                  // width: 300,
                  child: ListView.builder(
                    itemCount: worklist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          // color: Colors.amber,
                          width: 250,
                          child: PreviousWorkItem(
                            cubit: cubit,
                            image: worklist[index].image,
                            workType: worklist[index].workType!,
                            workTitle: worklist[index].workTitle,
                            workDescription: worklist[index].workDescription,
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
        
        //++++++++++++web
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleAndDescriptionWidget(
                        title: "اعمالنا",
                        description:
                            "تقدم شركة البناء الحديث للمقاولات العامة خدمتها لتغطى مجموعه متنوعه من المشاريع المختلفة مثل : التجارية - السكنية - الترفيهية - التعليمية - الصناعية والبنية التحتية وغيرها"),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: InkWell(
                        onTap: () {
                          cubit.selectAppBar(3,0);
                        },
                        child: SizedBox(
                            height: 35,
                            width: 165,
                            child: HoverWidget(
                              hoverChild: Container(
                                decoration: BoxDecoration(
                                    color: primaryC4,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "عرض جميع الاعمال",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Alexandria",
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    Icon(
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
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "عرض جميع الاعمال",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Alexandria",
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Icon(
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
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: SizedBox(
                  height: 250,
                  // width: 300,
                  child: ListView.builder(
                    itemCount: worklist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          // color: Colors.amber,
                          width: 250,
                          child: PreviousWorkItem(
                            cubit: cubit,
                            image: worklist[index].image,
                            workType: worklist[index].workType!,
                            workTitle: worklist[index].workTitle,
                            workDescription: worklist[index].workDescription,
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
    );
  }
}
