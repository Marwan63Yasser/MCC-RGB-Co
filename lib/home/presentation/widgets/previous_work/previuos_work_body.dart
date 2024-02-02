import 'package:company_profile/home/presentation/widgets/differentWidgets/title_description..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hovering/hovering.dart';

import '../../../../constants.dart';
import '../../../data/manager/cubit.dart';
import '../../../data/manager/states.dart';
import '../../../data/model/workModel.dart';

class PreviousServicesBody extends StatelessWidget {
  PreviousServicesBody({super.key});

  final List<WorkModel> worklist = [
    WorkModel(
        workType: "سكني",
        workTitle: "ڤيلل البناء الحديث",
        workDescription: "يتكون من 10 ڤيلل سكنية خاصة بنظام تسليم المفتاح بإجمالي مساحة 3,600 م2",
        image: 'assets/images/w1-1.jpg'),
    WorkModel(
        workType: "تجاري",
        workTitle: "برجين تجاريين",
        workDescription: "برجين تجاريين بحي الأثير بالدمام ويبلغ مجموع مساحتهما 16,940 م2 بارتفاع 10 طوابق لكل منهما",
        image: 'assets/images/w2-1.jpg'),
    WorkModel(
        workType: "سكني",
        workTitle: "مجمع ڤيلل الفاخرية",
        workDescription:
            'يتكون هذا المجمع من 30 ڤيلا متصلة ومنفصلة بمساحات اجمالية 14,800 م2',
        image: 'assets/images/w3-1.jpg'),
    WorkModel(
        workType: "سكني",
        workTitle: "عمارة سكنية",
        workDescription: "تتكون العمارة من 8 شقق سكنية بنظام تسليم المفتاح ويبلغ مجموع مساحة الشقق 1,700 م2",
        image: 'assets/images/w4-1.jpg'),
    ];

  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);

    return BlocBuilder<BrokerCubit, BrokerStates>(
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleAndDescriptionWidget(
              title: "اعمالنا",
              description:
                  "تقدم شركة البناء الحديث للمقاولات العامة خدمتها لتغطى مجموعه متنوعه من المشاريع المختلفة مثل : التجارية - السكنية - الترفيهية - التعليمية - الصناعية والبنية التحتية وغيرها"),
        
          const SizedBox(
            height: 60,
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
              return SizedBox(
                height: 100,
                width: 100,
                child: InkWell(
                  onTap: () {
                    cubit.selectAppBar(7,0);

                    
                  },
                  child: HoverWidget(
                    onHover: (event) {},
                    hoverChild: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              worklist[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: primaryC4,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            height: 40,
                            width: 80,
                            child: Center(
                                child: Text("${worklist[index].workType}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: "Alexandria",
                                        fontWeight: FontWeight.w400))),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                            foregroundDecoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              gradient: LinearGradient(
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(220, 39, 35, 51),
                                  Color.fromARGB(220, 39, 35, 51),
                                  Color.fromARGB(220, 39, 35, 51),
                                  Color.fromARGB(220, 39, 35, 51),
                                  Color.fromARGB(60, 39, 35, 51),
                                  Color.fromARGB(0, 39, 35, 51),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              defaultText(worklist[index].workTitle, 10,
                                  FontWeight.w400,
                                  color: primaryC4),
                              const SizedBox(
                                height: 5,
                              ),
                              defaultText(worklist[index].workDescription,
                                  10, FontWeight.w400,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Opacity(
                            opacity: 0.85,
                            child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: primaryC4,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "تعرف على المزيد",
                                      style: TextStyle(
                                          fontFamily: "Alexandria",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: primaryC2),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    )
                                    // defaultText("تعرف على المزيد", 15,
                                    //     FontWeight.w500,
                                    //     color: primaryC2),
                                    ,
                                    Icon(
                                      Icons.arrow_forward,
                                      color: primaryC2,
                                    )
                                  ],
                                )),
                          ),
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              worklist[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: primaryC4,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            height: 40,
                            width: 80,
                            child: Center(
                                child: Text("${worklist[index].workType}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: "Alexandria",
                                        fontWeight: FontWeight.w400))),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                            foregroundDecoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              gradient: LinearGradient(
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(220, 39, 35, 51),
                                  Color.fromARGB(220, 39, 35, 51),
                                  Color.fromARGB(220, 39, 35, 51),
                                  Color.fromARGB(220, 39, 35, 51),
                                  Color.fromARGB(60, 39, 35, 51),
                                  Color.fromARGB(0, 39, 35, 51),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              defaultText(worklist[index].workTitle, 10,
                                  FontWeight.w400,
                                  color: primaryC4),
                              const SizedBox(
                                height: 5,
                              ),
                              defaultText(worklist[index].workDescription,
                                  10, FontWeight.w400,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
