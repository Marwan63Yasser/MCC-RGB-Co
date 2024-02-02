import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/model/serviceModel.dart';
import 'package:company_profile/home/presentation/widgets/footer.dart';
import 'package:company_profile/home/presentation/widgets/OurServices/widget_next_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../constants.dart';
import '../navBar/content_navbar.dart';
import '../differentWidgets/text_overImage.dart';

class OurServicesBody extends StatelessWidget {
  const OurServicesBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    final List<ServiceModel> serviceList = [
    ServiceModel(
      serviceTitle: S.of(context).Service1,
      serviceDescription:S.of(context).Service1Desc,
      image: "assets/images/1.png",
      textLeft: false,
    ),
    ServiceModel(
        serviceTitle: S.of(context).Service2,
      serviceDescription:S.of(context).Service2Desc,
        image: "assets/images/2.png",
        textLeft: true),
    ServiceModel(
        serviceTitle: S.of(context).Service3,
      serviceDescription:S.of(context).Service3Desc,
        image: "assets/images/3.png",
        textLeft: false),
    ServiceModel(
        serviceTitle: S.of(context).Service4,
      serviceDescription:S.of(context).Service4Desc,
        image: "assets/images/4.png",
        textLeft: true),
  ];
    return SingleChildScrollView(
      child: Column(
        children: [
          TextOverImage(
              title: S.of(context).OurServices,
              subTitle: "",
              image: "assets/images/servicesbg.png"),
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
                  child: defaultText(S.of(context).OurServices, 12, FontWeight.w500,
                      color: primaryC2),),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: defaultText(S.of(context).OurServices, 16, FontWeight.w500,
                      color: primaryC2),
                ),
              ),
            ],
          ), shadowAppear: true,),

          Column(
            children: List.generate(serviceList.length, (index) {
              return serviceList[index].textLeft
                  ? Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 30, top: 30),
                      child: WidgetNextImage(
                          image: serviceList[index].image,
                          title: serviceList[index].serviceTitle,
                          text: serviceList[index].serviceDescription,
                          textLeft: serviceList[index].textLeft,
                          index: index,
                          ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: WidgetNextImage(
                          image: serviceList[index].image,
                          title: serviceList[index].serviceTitle,
                          text: serviceList[index].serviceDescription,
                          textLeft: serviceList[index].textLeft,
                          index: index,
                          ),
                    );
              
            }),
          ),

          MyFooter()
        ],
      ),
    );
  }
}




          // const Padding(
          //   padding: EdgeInsets.only(top: 30, bottom: 30),
          //   child: WidgetNextImage(
          //       image: "assets/images/HandShake.jpeg",
          //       title: "انشاء المباني وصيانتها",
          //       text:
          //           "تقوم شركة البناء الحديث للمقاولات العامة بكافة أعمال المقاولات من حيث إنشاء وصيانة المباني، مثل العقارات السكنية والشركات الخاصة، وتشييد المدارس والمستشفيات والمراكز التجارية والمولات، بالإضافة للفلل والقصور والبيوت وغير ذلك، وتتميز المؤسسة بتوفير عدد كبير من العمالة المتخصصة في أعمال البناء المختلفة ومتطلباتها، مثل السباكة والنجارة والحدادة والصرف الصحي وغيرها بالتنسيق مع أفضل المهندسين المحترفين، بالإضافة إلى الاستشاريين في المجال الهندسي والإنشائي والمعماري مع توفير كافة مواد البناء اللازمة والأدوات الضرورية للعمل.",
          //       textLeft: false),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Container(
          //   color: Colors.white,
          //   width: double.infinity,
          //   padding: EdgeInsets.only(bottom: 30, top: 30),
          //   child: const WidgetNextImage(
          //       image: "assets/images/HandShake.jpeg",
          //       title: "انشاء المباني وصيانتها",
          //       text:
          //           "تقوم شركة البناء الحديث للمقاولات العامة بكافة أعمال المقاولات من حيث إنشاء وصيانة المباني، مثل العقارات السكنية والشركات الخاصة، وتشييد المدارس والمستشفيات والمراكز التجارية والمولات، بالإضافة للفلل والقصور والبيوت وغير ذلك، وتتميز المؤسسة بتوفير عدد كبير من العمالة المتخصصة في أعمال البناء المختلفة ومتطلباتها، مثل السباكة والنجارة والحدادة والصرف الصحي وغيرها بالتنسيق مع أفضل المهندسين المحترفين، بالإضافة إلى الاستشاريين في المجال الهندسي والإنشائي والمعماري مع توفير كافة مواد البناء اللازمة والأدوات الضرورية للعمل.",
          //       textLeft: true),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 30, bottom: 30),
          //   child: WidgetNextImage(
          //       image: "assets/images/HandShake.jpeg",
          //       title: "انشاء المباني وصيانتها",
          //       text:
          //           "تقوم شركة البناء الحديث للمقاولات العامة بكافة أعمال المقاولات من حيث إنشاء وصيانة المباني، مثل العقارات السكنية والشركات الخاصة، وتشييد المدارس والمستشفيات والمراكز التجارية والمولات، بالإضافة للفلل والقصور والبيوت وغير ذلك، وتتميز المؤسسة بتوفير عدد كبير من العمالة المتخصصة في أعمال البناء المختلفة ومتطلباتها، مثل السباكة والنجارة والحدادة والصرف الصحي وغيرها بالتنسيق مع أفضل المهندسين المحترفين، بالإضافة إلى الاستشاريين في المجال الهندسي والإنشائي والمعماري مع توفير كافة مواد البناء اللازمة والأدوات الضرورية للعمل.",
          //       textLeft: false),
          // ),

          // const SizedBox(
          //   height: 40,
          // ),