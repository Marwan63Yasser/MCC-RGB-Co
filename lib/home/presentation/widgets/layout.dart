import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/presentation/widgets/navBar/webNavBar.dart';
import 'package:company_profile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../constants.dart';
import 'differentWidgets/social_contacts.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

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
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return BlocBuilder<BrokerCubit, BrokerStates>(builder: (context, state) {
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 223, 223, 223),
          key: scaffoldKey,
          drawer: Drawer(
            backgroundColor: (cubit.selectedIndex == 10 || cubit.selectedIndex == 11) ? Colors.white : const Color.fromARGB(255, 39, 35, 51),
            width: MediaQuery.of(context).size.width * .35,
            child: Padding(
              padding: EdgeInsets.only(top: 20, right: isArabic() ? 30 : 0, left: isArabic() ? 0 : 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(navigatorsScreen.length, (index) {
                  return InkWell(
                    onTap: () {
                      cubit.selectAppBar(index,0);
                      //print(cubit.navigatorsScreen[index]);
                      scaffoldKey.currentState!.closeDrawer();
                    },
                    child: cubit.selections[index]
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: defaultText(
                                  navigatorsScreen[index],
                                  14,
                                  FontWeight.w400,
                                  color: primaryC4,
                                ),
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 15

                                ),
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
                  );
                }),
              ),
            ),
          ),
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: ResponsiveVisibility(
                  visible: true,
                  visibleWhen: const [
                    Condition.largerThan(name: MOBILE),
                    Condition.largerThan(name: TABLET)
                  ],
                  child: MyNavBar(
                    drawerFunction: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ))),

          floatingActionButton: cubit.selectedIndex != 5 ? const SocialContacts() : null,
          body: cubit.mainScreenName[cubit.selectedIndex],

        );
    });
  }
}
