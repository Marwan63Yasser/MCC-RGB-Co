//import 'dart:html';

import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/presentation/widgets/contact_us.dart';
import 'package:company_profile/home/presentation/widgets/HowWeWork/how_we_work.dart';
import 'package:company_profile/home/presentation/widgets/ourClients/our_clients_body.dart';
import 'package:company_profile/home/presentation/widgets/previous_work/previous_work.dart';
import 'package:company_profile/home/presentation/widgets/ReadMore/readMore_body.dart';
import 'package:company_profile/home/presentation/widgets/OurServices/service_details_screen.dart';
import 'package:company_profile/home/presentation/widgets/visionAndValue/vision_value_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/home_View.dart';
import '../../presentation/widgets/about_company.dart';
import '../../presentation/widgets/previous_work/detailsScreen.dart';
import '../../presentation/widgets/OurServices/our_services.dart';
import '../../presentation/widgets/previous_work/ourWork.dart';

int workIndex = 0;
int serviceIndex = 0;
int workImagesIndex = 0;

class BrokerCubit extends Cubit<BrokerStates> {
  
  BrokerCubit() : super(BrokerInitialState());
  static BrokerCubit get(context) => BlocProvider.of(context);
  
  int selectedIndex = 0;
  int selectedScreen = 0;
  bool selected = false;
  List<bool> selections = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  final List mainScreenName = [
    HomePage(), //0 الرئيسيه
    const AboutCompanyScreen(), //1 عن الشركة
    const OurClientsBody(), //2 العملاء
    const PreviousWorkBody(), //3 اعمالنا
    const OurServicesBody(), //4 خدماتنا
    ContactUsScreen(), //5 تواصل معنا
    const VisionAndValueScreen(), //6 الرؤيه والقيم
    const HowWeWorkScreen(), //7 كيف نعمل
    DetailsScreen(workIndex: workIndex,workImagesIndex: workImagesIndex,), //8 تفاصيل اعمالنا
    ServiceDetailsScreen(serviceIndex: serviceIndex,), //9 تفاصيل خدماتنا
    const SingleChildScrollView(child: ReadMoreBody()), //10 صفحة المزيد
    OurWorkScreen(), //11 صفحه اعمالنا
  ];

  final List whoWeArePages = [const HowWeWorkScreen(), const VisionAndValueScreen()];

  selectContentScreen(index) {
    selectedScreen = index;

    emit(SelectContentScreenSuccessState());
  }

  selectAppBar(index, workmodel) {
    selectedIndex = index;
    for (var i = 0; i < selections.length; i++) {
      if (index == 6 || index == 7) {
        selections[1] = true;
      }
      //  else if (index == 5) {
      //   selections[0] = true;
      // }
      else if (index == 8) {
        selections[3] = true;
      } else if (index == 9) {
        selections[4] = true;
      } else if (index == 5 || index == 10 || index == 11) {
        selections[0] = true;
      }
      selections[i] = false;
    }

    // for (var i = 0; i < selections.length; i++) {
    //   if (index == 5 || index == 6) {
    //     selections[1] = true;
    //   } else if (index == 7) {
    //     selections[3] = true;
    //   } else if (index == 8) {
    //     selections[4] = true;
    //   } else if (index == 9 || index == 10) {
    //     selections[0] = true;
    //   }
    //   selections[i] = false;
    // }
    selections[index] = true;
    if(index == 8)
    {
      workIndex = workmodel;
      // workIndex.workTitle = workmodel[0].workTitle;
      // workIndex.workDescription = workmodel[0].workDescription;
      // workIndex.image = workmodel[0].image;
      workImagesIndex = workmodel;
    }
    else if(index == 9)
    {
      serviceIndex = workmodel;
      // serviceIndex.serviceTitle = workmodel.serviceTitle;
      // serviceIndex.serviceDescription = workmodel.serviceDescription;
      // serviceIndex.image = workmodel.image;
      // serviceIndex.textLeft = workmodel.textLeft;
    }
    emit(SelectAppBarSuccessState());
  }


}
