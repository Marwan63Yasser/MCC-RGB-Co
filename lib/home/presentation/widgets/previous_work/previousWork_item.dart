import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/main.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../../../constants.dart';

class PreviousWorkItem extends StatelessWidget {
  const PreviousWorkItem({
    Key? key,
    required this.cubit,
    required this.workType,
    required this.workTitle,
    required this.workDescription,
    required this.image,
    required this.index,
  }) : super(key: key);

  final BrokerCubit cubit;
  final String workType;
  final String workTitle;
  final String workDescription;
  final String image;
  final int index;
  // final List<WorkModel> worklist;

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 100,
      width: 100,
      child: InkWell(
        onTap: () {
          // cubit.selectAppBar(7);
          cubit.selectAppBar(8,index);
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
                    image,
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
                      child: Text(workType,
                          style: TextStyle(
                              fontSize: isArabic() ? 18 : 11,
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
                    defaultText(workTitle, 10, FontWeight.w400,
                        color: primaryC4),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultText(workDescription, 10, FontWeight.w400,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).SeeMore,
                            style: const TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: primaryC2),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
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
                    image,
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
                      child: Text(workType,
                          style: TextStyle(
                              fontSize: isArabic() ? 18 : 11,
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
                    defaultText(workTitle, 10, FontWeight.w400,
                        color: primaryC4),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultText(workDescription, 10, FontWeight.w400,
                        color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
