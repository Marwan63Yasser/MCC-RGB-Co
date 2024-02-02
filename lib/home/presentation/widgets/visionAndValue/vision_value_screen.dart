import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/presentation/widgets/navBar/content_navbar.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/text_overImage.dart';
import 'package:company_profile/home/presentation/widgets/visionAndValue/vision_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../constants.dart';
import '../footer.dart';

class VisionAndValueScreen extends StatelessWidget {
  const VisionAndValueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);

    return BlocBuilder<BrokerCubit, BrokerStates>(
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            TextOverImage(
              title: S.of(context).About,
              subTitle: S.of(context).VisionANDValues,
              image: "assets/images/who_we_arebg.png",
            ),
            ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: MOBILE),
                Condition.largerThan(name: TABLET),
              ],
              replacement: ContentNavBar(
                  navcontent: Row(
                children: [
                  InkWell(
                    onTap: () {
                      cubit.selectAppBar(1,0);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: defaultText(S.of(context).About, 12, FontWeight.w500,
                          color: basicC4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child:
                        defaultText("/", 12, FontWeight.w500, color: basicC4),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: defaultText(S.of(context).VisionANDValues, 12, FontWeight.w500,
                        color: primaryC2),
                  ),
                ],
              ), shadowAppear: true,),
              child: ContentNavBar(
                  navcontent: Row(
                children: [
                  InkWell(
                    onTap: () {
                      cubit.selectAppBar(1,0);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: defaultText(S.of(context).About, 16, FontWeight.w500,
                          color: basicC4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child:
                        defaultText("/", 16, FontWeight.w500, color: basicC4),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: defaultText(S.of(context).VisionANDValues, 16, FontWeight.w500,
                        color: primaryC2),
                  ),
                ],
              ), shadowAppear: true,),
            ),
            const SizedBox(
              height: 20,
            ),
            const VisionAndValueBody(),
            const SizedBox(
              height: 40,
            ),
            MyFooter()
          ],
          //   )),
          // ),
        ),
      ),
    );
  }
}
