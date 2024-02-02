// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/changeLang/bloc/change_language_bloc.dart';
import 'package:company_profile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hovering/hovering.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';

import '../../../../constants.dart';


class MyNavBar extends StatelessWidget {
  const MyNavBar({
    Key? key,
    required this.drawerFunction,
  }) : super(key: key);

  final Function drawerFunction;

  @override
  Widget build(BuildContext context) {
    final List navigatorsScreen = [
    S.of(context).Main,
    S.of(context).About,
    S.of(context).OurClients,
    S.of(context).Portfolio,
    S.of(context).OurServices,
    S.of(context).ContactUs,
  ];
    return BlocBuilder<BrokerCubit, BrokerStates>(
      builder: (context, state) {
        var cubit = BrokerCubit.get(context);
        return ResponsiveVisibility(
          visible: false,
          visibleWhen: const [
            Condition.largerThan(name: MOBILE),
            Condition.largerThan(name: TABLET)
          ],
          replacement: Container(
            width: double.infinity,
            height: 70,
            color: cubit.selectedIndex == 10 || cubit.selectedIndex == 11 ? Colors.white : const Color.fromARGB(255, 39, 35, 51),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 10, top: 6, right: isArabic() ? 20 : 0, left: isArabic() ? 0 : 20 ),
                  child: InkWell(
                    onTap: () {
                      cubit.selectAppBar(0,0);
                    },
                    child: Image.asset(
                      cubit.selectedIndex == 10 || cubit.selectedIndex == 11
                          ? "assets/images/logoLight.png"
                          : "assets/images/logoDark.png",
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:  EdgeInsets.only(left: isArabic() ? 20 : 0, right: isArabic() ? 0 : 20),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 32,
                          height: 32,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ).copyWith(
                              shape: MaterialStateProperty.resolveWith<
                                  RoundedRectangleBorder>(
                                (states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(color: primaryC4));
                                  }
                                  return RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: cubit.selectedIndex == 10 ||
                                                  cubit.selectedIndex == 11
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  28, 255, 255, 255)));
                                },
                              ),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return primaryC4;
                                  }
                                  return cubit.selectedIndex == 10 ||
                                          cubit.selectedIndex == 11
                                      ? Colors.white
                                      : const Color.fromARGB(28, 255, 255, 255);
                                },
                              ),
                            ),
                            onPressed: () {
                              if(isArabic())
                              {
                                BlocProvider.of<AppLanguageBloc>(context).add(EnglishLanguageEvent());
                              }
                              else
                              {
                                BlocProvider.of<AppLanguageBloc>(context).add(ArabicLanguageEvent());
                              }
                            },
                            child: CircleAvatar(
                              
                              backgroundColor:
                                  const Color.fromARGB(28, 255, 255, 255),
                              child: Text(
                                isArabic() ? "EN" : "عربي",
                                style: TextStyle(
                                    fontSize: isArabic() ? 14 : 10,
                                    color: cubit.selectedIndex == 10 ||
                                            cubit.selectedIndex == 11
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () => drawerFunction(),
                        child: HoverWidget(
                          onHover: (event) {},
                          hoverChild: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                  color: primaryC4,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: primaryC4)),
                              child: Icon(Icons.menu_rounded,
                                  size: 15,
                                  color: cubit.selectedIndex == 10 ||
                                          cubit.selectedIndex == 11
                                      ? const Color.fromARGB(255, 39, 35, 51)
                                      : Colors.white)),
                          child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: cubit.selectedIndex == 10 ||
                                              cubit.selectedIndex == 11
                                          ? const Color.fromARGB(255, 39, 35, 51)
                                          : Colors.white)),
                              child: Icon(Icons.menu_rounded,
                                  size: 15,
                                  color: cubit.selectedIndex == 10 ||
                                          cubit.selectedIndex == 11
                                      ? const Color.fromARGB(255, 39, 35, 51)
                                      : Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          child: Container(
            padding: const EdgeInsets.symmetric(/*horizontal: 55*/horizontal: 0),
            width: double.infinity,
            height: 80,
            color: cubit.selectedIndex == 10 || cubit.selectedIndex == 11 ? Colors.white : const Color.fromARGB(255, 39, 35, 51),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10,
                      top: 6,
                      right: isArabic() ? 10 : 0,
                      left: isArabic() ? 0 : 10,
                      ),
                  child: InkWell(
                    onTap: () {
                      cubit.selectAppBar(0,0);
                    },
                    child: Image.asset(
                      cubit.selectedIndex == 10 || cubit.selectedIndex == 11
                          ? "assets/images/logoLight.png"
                          : "assets/images/logoDark.png",
                      width: MediaQuery.of(context).size.width * .1,
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:  EdgeInsets.only(left: isArabic() ? 0 : 75, right: isArabic() ? 30 : 0),
                  child: Row(
                    children:
                        List.generate(navigatorsScreen.length - 1, (index) {
                      return InkWell(
                        onTap: () {
                          cubit.selectAppBar(index,0);
                          //print(cubit.navigatorsScreen[index]);
                        },
                        child: HoverWidget(
                          onHover: (event) {},
                          hoverChild: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25, left: 20, right: 20),
                                child: defaultText(
                                  navigatorsScreen[index],
                                  14,
                                  FontWeight.w400,
                                  color: primaryC4,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 42,
                                height: 1,
                                color: primaryC4,
                              )
                            ],
                          ),
                          child: cubit.selections[index]
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 20, right: 20),
                                      child: defaultText(
                                        navigatorsScreen[index],
                                        14,
                                        FontWeight.w400,
                                        color: primaryC4,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 42,
                                      height: 1,
                                      color: primaryC4,
                                    )
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, left: 20, right: 20),
                                  child: defaultText(
                                    navigatorsScreen[index],
                                    14,
                                    FontWeight.w400,
                                    color: cubit.selectedIndex == 10 ||
                                            cubit.selectedIndex == 11
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                        ),
                      );
                    }),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 38,
                          height: 38,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ).copyWith(
                              shape: MaterialStateProperty.resolveWith<
                                  RoundedRectangleBorder>(
                                (states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Color(0xffD19026)));
                                  }
                                  return RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: cubit.selectedIndex == 10 ||
                                                  cubit.selectedIndex == 11
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  28, 255, 255, 255)));
                                },
                              ),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return const Color(0xffD19026);
                                  }
                                  return cubit.selectedIndex == 10 ||
                                          cubit.selectedIndex == 11
                                      ? Colors.white
                                      : const Color.fromARGB(28, 255, 255, 255);
                                },
                              ),
                            ),
                            onPressed: () {
                              if(isArabic())
                              {
                                BlocProvider.of<AppLanguageBloc>(context).add(EnglishLanguageEvent());
                              }
                              else
                              {
                                BlocProvider.of<AppLanguageBloc>(context).add(ArabicLanguageEvent());
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(28, 255, 255, 255),
                              child: Text(
                                isArabic() ? "EN" : "عربي",
                                style: TextStyle(
                                    fontSize: isArabic() ? 16 :13,
                                    color: cubit.selectedIndex == 10 ||
                                            cubit.selectedIndex == 11
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 15,
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
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Color(0xffD19026)));
                                  }
                                  return RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: cubit.selectedIndex == 10 ||
                                                  cubit.selectedIndex == 11
                                              ? Colors.black
                                              : Colors.white));
                                },
                              ),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return const Color(0xffD19026);
                                  }
                                  return cubit.selectedIndex == 10 ||
                                          cubit.selectedIndex == 11
                                      ? Colors.white
                                      : const Color.fromARGB(28, 255, 255, 255);
                                },
                              ),
                            ),
                            onPressed: () {
                              // cubit.selectAppBar(10);
                              cubit.selectAppBar(5,0);
                            },
                            child: Text(
                              S.of(context).ContactUs,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Alexandria",
                                  color: cubit.selectedIndex == 10 ||
                                          cubit.selectedIndex == 11
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
