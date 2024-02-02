import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/data/model/workModel.dart';
import 'package:company_profile/home/presentation/widgets/footer.dart';
import 'package:company_profile/home/presentation/widgets/navBar/content_navbar.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/text_overImage.dart';
import 'package:company_profile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants.dart';



class DetailsScreen extends StatefulWidget {
  final int workIndex;
  final int workImagesIndex;
  const DetailsScreen({super.key, required this.workIndex, required this.workImagesIndex});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final items = [
    ["assets/images/w1-1.jpg","assets/images/w1-2.jpg","assets/images/w1-3.jpg","assets/images/w1-4.jpg","assets/images/w1-5.jpg",],
    ["assets/images/w2-1.jpg","assets/images/w2-2.jpg","assets/images/w2-3.jpg",],
    ["assets/images/w3-1.jpg","assets/images/w3-2.jpg","assets/images/w3-3.jpg","assets/images/w3-4.jpg","assets/images/w3-5.jpg","assets/images/w3-6.jpg","assets/images/w3-7.jpg",],
    ["assets/images/w4-1.jpg","assets/images/w4-2.jpg",],
  ];
  final _controller = PageController();
  int currentIndex = 0;
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
          Condition.largerThan(name: TABLET),
        ],
        replacement: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextOverImage(
                  title: S.of(context).Portfolio,
                  subTitle: worklist[workIndex].workTitle,
                  image: "assets/images/houses.png"),
              ContentNavBar(
                  navcontent: Row(
                children: [
                  /*Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: InkWell(
                      onTap: () {
                        cubit.selectAppBar(11);
                      },
                      child: defaultText("اعمالنا", 12, FontWeight.w500,
                          color: basicC4),
                    ),
                  ),
                  defaultText("/", 12, FontWeight.w500, color: basicC4),*/
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: InkWell(
                      onTap: () {
                        cubit.selectAppBar(3,0);

                        /// its done dont forget it
                      },
                      child: defaultText(
                          S.of(context).ViewAllWorks, 12, FontWeight.w500,
                          color: basicC4),
                    ),
                  ),
                  defaultText("/", 12, FontWeight.w500, color: basicC4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: InkWell(
                      onTap: () {},
                      child: defaultText(
                          worklist[workIndex].workTitle, 12, FontWeight.w500,
                          color: primaryC2),
                    ),
                  ),
                ],
              ),shadowAppear: true,),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:  EdgeInsets.only(right: isArabic() ? 15 : 0,left: isArabic() ? 0 : 15,top: 15),
                child: defaultText(worklist[workIndex].workTitle, 20, FontWeight.w400,
                    color: primaryC3),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: defaultText(
                      worklist[workIndex].workDescription,
                      14,
                      FontWeight.w400,
                      color: primaryC2),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .5,
                child: PageView.builder(
                  onPageChanged: (value) {
                    currentIndex = value;
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items[workImagesIndex].length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Image(
                          image: AssetImage(items[workImagesIndex][index]),//----------------------------------------------------------------------------------
                          fit: BoxFit.cover,
                          width: double.infinity,
                          // height: ,
                          height: MediaQuery.of(context).size.height * .5,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: isArabic() ? 12 : 0, left: isArabic() ? 0 : 12,),
                                child: InkWell(
                                  onTap: () {
                                    if (currentIndex >= 0) {
                                      _controller.previousPage(
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    }
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 50,
                                    color: primaryC4,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: InkWell(
                                  onTap: () {
                                    if (currentIndex >= 0) {
                                      _controller.nextPage(
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    }
                                    if (currentIndex == items.length - 1) {
                                      setState(() {
                                        currentIndex = 0;
                                      });
                                    }
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 50,
                                    color: primaryC4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: SmoothPageIndicator(
                              controller: _controller,
                              count: items[workImagesIndex].length,
                              effect: const ExpandingDotsEffect(
                                  dotColor: Color.fromARGB(255, 39, 35, 51),
                                  activeDotColor: primaryC4,
                                  dotWidth: 10,
                                  dotHeight: 10),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              MyFooter()
            ],
          ),
        ),
        
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MyNavBar(),
              TextOverImage(
                  title: S.of(context).Portfolio,
                  subTitle: worklist[workIndex].workTitle,
                  image: "assets/images/houses.png"),
              ContentNavBar(
                  navcontent: Row(
                children: [
                  /*InkWell(
                      onTap: () {
                        return Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            cubit.selectAppBar(11);
                          },
                          child: defaultText("اعمالنا", 16, FontWeight.w500,
                              color: basicC4),
                        ),
                      )),
                  defaultText("/", 16, FontWeight.w500, color: basicC4),*/
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        cubit.selectAppBar(3,0);
                      },
                      child: defaultText(
                          S.of(context).ViewAllWorks, 16, FontWeight.w500,
                          color: basicC4),
                    ),
                  ),
                  defaultText("/", 16, FontWeight.w500, color: basicC4),
                  InkWell(
                      onTap: () {
                        return Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {},
                          child: defaultText(
                              worklist[workIndex].workTitle, 16, FontWeight.w500,
                              color: primaryC2),
                        ),
                      )),
                ],
              ),
              shadowAppear: true,),
              Align(
                alignment: isArabic() ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(right: isArabic() ? 30 : 0,left: isArabic() ? 0 : 30 ,top: 30),
                  child: defaultText(worklist[workIndex].workTitle, 30, FontWeight.w400,
                      color: primaryC3),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Align(
                alignment: isArabic() ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: defaultText(
                        worklist[workIndex].workDescription,
                        16,
                        FontWeight.w400,
                        color: primaryC2),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.height * .77,
                child: PageView.builder(
                  onPageChanged: (value) {
                    currentIndex = value;
                  },
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: items[workImagesIndex].length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Stack(
                      
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                          child: Image(
                            image: AssetImage(items[workImagesIndex][index]),//------------------------------------------------------------------------------
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width*0.7,
                            height: MediaQuery.of(context).size.height * .77,
                          ),
                        ),
                        Center(
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: isArabic() ? 12 : 0,left: isArabic() ? 0 : 12),
                                child: InkWell(
                                  onTap: () {
                                    if (currentIndex >= 0) {
                                      _controller.previousPage(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    }
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 50,
                                    color: primaryC4,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: InkWell(
                                  onTap: () {
                                    if (currentIndex >= 0) {
                                      _controller.nextPage(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    }
                                    if (currentIndex == items.length - 1) {
                                      setState(() {
                                        currentIndex = 0;
                                      });
                                    }
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 50,
                                    color: primaryC4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: SmoothPageIndicator(
                              controller: _controller,
                              count: items[workImagesIndex].length,
                              effect: const ExpandingDotsEffect(
                                  dotColor: Color.fromARGB(255, 39, 35, 51),
                                  activeDotColor: primaryC4,
                                  dotWidth: 10,
                                  dotHeight: 10),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              MyFooter()
            ],
            //   ),
            // ),
            // ),
          ),
        ),
      ),
    );
  }
}
