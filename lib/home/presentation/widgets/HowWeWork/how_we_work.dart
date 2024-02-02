import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/presentation/widgets/navBar/content_navbar.dart';
import 'package:company_profile/home/presentation/widgets/HowWeWork/how_we_work_body.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/text_overImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../constants.dart';
import '../footer.dart';

class HowWeWorkScreen extends StatefulWidget {
  const HowWeWorkScreen({super.key});

  @override
  State<HowWeWorkScreen> createState() => _HowWeWorkScreenState();
}

class _HowWeWorkScreenState extends State<HowWeWorkScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);

    return BlocBuilder<BrokerCubit, BrokerStates>(
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            TextOverImage(
              title: S.of(context).About,
              subTitle: S.of(context).howDoWeWork,
              image: "assets/images/who_we_arebg.png",
            ),
            ContentNavBar(
                navcontent: ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: MOBILE),
                Condition.largerThan(name: TABLET),
              ],
              replacement: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        cubit.selectAppBar(1,0);
                      },
                      child: defaultText(S.of(context).About, 12, FontWeight.w500,
                          color: basicC4),
                    ),
                  ),
                  defaultText("/", 12, FontWeight.w500, color: basicC4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: defaultText(S.of(context).AboutDesc, 12, FontWeight.w500,
                        color: primaryC2),
                  ),
                ],
              ),
              
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        cubit.selectAppBar(1,0);
                      },
                      child: defaultText(S.of(context).About, 16, FontWeight.w500,
                          color: basicC4),
                    ),
                  ),
                  defaultText("/", 16, FontWeight.w500, color: basicC4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: defaultText(S.of(context).howDoWeWork, 16, FontWeight.w500,
                        color: primaryC2),
                  ),
                ],
              ),
            ), shadowAppear: true,),
            const SizedBox(
              height: 20,
            ),
            const HowWeWorkBody(),
            const SizedBox(
              height: 40,
            ),
            MyFooter()
          ],
        ),
      ),
    );
  }
}
