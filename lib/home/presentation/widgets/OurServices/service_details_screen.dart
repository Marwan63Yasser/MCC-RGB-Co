import 'dart:convert';

import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/data/model/serviceModel.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/defaultTextField.dart';
import 'package:company_profile/home/presentation/widgets/navBar/content_navbar.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/text_overImage.dart';
import 'package:company_profile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../footer.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final int serviceIndex;
  const ServiceDetailsScreen({super.key, required this.serviceIndex});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String selectedService = isArabic() ? "بدون خدمة" : "None";
  bool validate_done = false;
  int statusCode = -1;
  final TextEditingController messageController = TextEditingController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var cubit = BrokerCubit.get(context);
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
    
    final List<String> serviceListForm = [S.of(context).None,S.of(context).Service1,S.of(context).Service2,S.of(context).Service3,S.of(context).Service4];
    return BlocBuilder<BrokerCubit, BrokerStates>(
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: MOBILE),
                Condition.largerThan(name: TABLET),
              ],
              replacement: Column(
                children: [
                  TextOverImage(
                      title: S.of(context).OurServices,
                      subTitle: serviceList[serviceIndex].serviceTitle,
                      image: "assets/images/houses.png"),
                  ContentNavBar(
                      navcontent: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: InkWell(
                          onTap: () {
                            cubit.selectAppBar(4,0);
                          },
                          child: defaultText(S.of(context).OurServices, 12, FontWeight.w500,
                              color: basicC4),
                        ),
                      ),
                      defaultText("/", 12, FontWeight.w500, color: basicC4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: defaultText(
                            serviceList[serviceIndex].serviceTitle, 12, FontWeight.w500,
                            color: primaryC2),
                      ),
                    ],
                  ),shadowAppear: true,),
                ],
              ),
              child: Column(
                children: [
                  TextOverImage(
                      title: S.of(context).OurServices,
                      subTitle: serviceList[serviceIndex].serviceTitle,
                      image: "assets/images/houses.png"),
                  ContentNavBar(
                      navcontent: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            cubit.selectAppBar(4,0);
                          },
                          child: defaultText(S.of(context).OurServices, 16, FontWeight.w500,
                              color: basicC4),
                        ),
                      ),
                      defaultText("/", 16, FontWeight.w500, color: basicC4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: defaultText(
                            serviceList[serviceIndex].serviceTitle, 16, FontWeight.w500,
                            color: primaryC2),
                      ),
                    ],
                  ),shadowAppear: true,),
                ],
              ),
            ),
            ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: MOBILE),
                Condition.largerThan(name: TABLET),
              ],
              replacement: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultText(serviceList[serviceIndex].serviceTitle, 36, FontWeight.w400,
                        color: const Color(0xffA5702A)),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width * .9,
                        child: defaultText(
                            serviceList[serviceIndex].serviceDescription,
                            18,
                            FontWeight.w500,
                          
                            color: primaryC2),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultText(S.of(context).ServiceRequest, 36, FontWeight.w400,
                        color: const Color(0xffA5702A)),
                    Center(
                      child: SizedBox(
                      width: MediaQuery.of(context).size.width * .96,

                      // width: 500,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          // width: MediaQuery.of(context).size.width * .45,
                          // width: 500,
                          // width: MediaQuery.of(context).size.width * .8,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Form(
                                  key: _formKey,
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: nameController,
                                          prefix: const Icon(Icons.person),
                                          labelText: S.of(context).Name),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: phoneController,
                                          prefix: const Icon(Icons.phone_enabled),
                                          labelText: S.of(context).Phone),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: emailController,
                                          prefix: const Icon(Icons.email),
                                          labelText: S.of(context).Email),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                      child: DropdownButtonFormField<String>(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      value: serviceListForm[serviceIndex+1],
                                      
                                      items: List.generate(serviceListForm.length, (index) =>
                                      DropdownMenuItem<String>(
                                        value: serviceListForm[index],
                                        child: Text(serviceListForm[index]),
                                      ),
                                      ),
                                      onChanged: (value) {
                                        selectedService = value.toString();
                                      },
                                      decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      //suffixIcon: suffix,
                                      focusColor: primaryC3,
                                      labelText: S.of(context).Service,
                                      labelStyle: const TextStyle(fontSize: 14, fontFamily: "Alexandria"),
                                      prefixIcon: const Icon(Icons.all_inbox_outlined),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)
                                            // color: primaryC3
                                            ),
                                      ),
                                      errorStyle: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)),
                                      ),
                                      hoverColor: Colors.white,
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: primaryC3),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)),
                                      ),
                                                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                        controller: messageController,
                                        labelText: S.of(context).Message,
                                        maxLines: 6,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: InkWell(
                                        onTap: () async{
                                          final http.Response response;
                                          if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

                                          response = await http.post(
                                            url,
                                            headers: {
                                              'origin': 'http://localhost',
                                              'Content-Type': 'application/json',
                                            },
                                            body: json.encode({
                                              'service_id': 'service_t6f4bnl',
                                              'template_id': 'template_i3t487i',
                                              'user_id': 'Ic2DzVtFaiORvvn8A',
                                              'template_params': {
                                                'user_subject': isArabic() ? "طلب جديد" : "New Request",

                                                'title': isArabic() ? "طلب جديد من موقع شركة البناء الحديث" : "New Request from MCC Website",

                                                'user_data_label': isArabic() ? "بيانات العميل:" : "The Client Data:",
                                                
                                                'name_label': S.of(context).Name,
                                                'user_name': nameController.text,

                                                'email_label': S.of(context).Email,
                                                'user_email': emailController.text,
                                                
                                                'phone_label': S.of(context).Phone,
                                                'user_phone': phoneController.text,

                                                'service_label': S.of(context).Service,
                                                'user_service': selectedService,
                                                
                                                'message_label': S.of(context).Message,
                                                'user_message': messageController.text,
                                              },
                                            }),
                                          );
                                          statusCode = response.statusCode;
                                          validate_done = true;
                                          }
                                          
                                          if(validate_done)
                                          {
                                            if(statusCode == 200)
                                            {
                                              nameController.text = " ";
                                            emailController.text = " ";
                                            phoneController.text = " ";
                                            messageController.text = " ";
                                            showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(isArabic() ? "تم إرسال طلبك بنجاح!" : "Your Request has been sent Successfully!",
                                                  style: const TextStyle(
                                                      fontFamily: "Alexandria"),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color.fromARGB(255, 39, 35, 51),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15)),
                                                        ),
                                                        child: Text(
                                                          isArabic() ? "حسناً" : "Okay",
                                                          style: const TextStyle(
                                                            fontFamily:"Alexandria",
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)),
                                              );
                                            });
                                          
                                            }
                                            else{
                                              showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(isArabic() ? "حدث خطأ! كود الحالة: $statusCode - حاول مرة أخرى" : "Error Occurred! Status Code: $statusCode - Try again",
                                                  style: const TextStyle(
                                                      fontFamily: "Alexandria"),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color.fromARGB(255, 39, 35, 51),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15)),
                                                        ),
                                                        child: Text(
                                                          isArabic() ? "حسناً" : "Okay",
                                                          style: const TextStyle(
                                                            fontFamily:"Alexandria",
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)),
                                              );
                                            });
                                          
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: primaryC3),
                                          child: Center(
                                              child: Text(
                                            S.of(context).Submit,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20),
                                          )),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                              ]),
                        ),
                      ),
                    ),
                    )
                    ],
                ),
              ),
              
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: SizedBox(
                        
                        child: defaultText(
                            serviceList[serviceIndex].serviceTitle, 40, FontWeight.w400,
                            color: const Color(0xffA5702A)),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: defaultText(
                            serviceList[serviceIndex].serviceDescription,
                            18,
                            FontWeight.w500,
                            color: primaryC2),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SizedBox(
                        
                        child: defaultText(
                            S.of(context).ServiceRequest, 40, FontWeight.w400,
                            color: const Color(0xffA5702A)),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      // width: 500,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        //color: primaryC7,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          // width: MediaQuery.of(context).size.width * .45,
                          // width: 500,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.all(8),
                                //   child: defaultText(
                                //       S.of(context).ContactUs, 28, FontWeight.w600,
                                //       color: primaryC3),
                                // ),
                                Form(
                                  
                                  key: _formKey,
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: nameController,
                                          prefix: const Icon(Icons.person),
                                          labelText: S.of(context).Name),
                                    ),
                                    Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 6,
                                                        horizontal: 4),
                                                child: DefaultTextField(
                                                    controller: phoneController,
                                                    prefix: const Icon(
                                                        Icons.phone_enabled),
                                                    labelText: S.of(context).Phone),
                                              ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                          controller: emailController,
                                          prefix: const Icon(Icons.email),
                                          labelText: S.of(context).Email),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                      child: DropdownButtonFormField<String>(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      value: serviceListForm[serviceIndex+1],
                                      
                                      items: List.generate(serviceListForm.length, (index) =>
                                      DropdownMenuItem<String>(
                                        value: serviceListForm[index],
                                        child: Text(serviceListForm[index]),
                                      ),
                                      ),
                                      onChanged: (value) {
                                        selectedService = value.toString();
                                      },
                                      decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      //suffixIcon: suffix,
                                      focusColor: primaryC3,
                                      labelText: S.of(context).Service,
                                      labelStyle: const TextStyle(fontSize: 14, fontFamily: "Alexandria"),
                                      prefixIcon: const Icon(Icons.all_inbox_outlined),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)
                                            // color: primaryC3
                                            ),
                                      ),
                                      errorStyle: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)),
                                      ),
                                      hoverColor: Colors.white,
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: primaryC3),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xffD2D2D2)),
                                      ),
                                                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: DefaultTextField(
                                        controller: messageController,
                                        labelText: S.of(context).Message,
                                        maxLines: 6,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4),
                                      child: InkWell(
                                        onTap: () async {
                                          final http.Response response;
                                          if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

                                          response = await http.post(
                                            url,
                                            headers: {
                                              'origin': 'http://localhost',
                                              'Content-Type': 'application/json',
                                            },
                                            body: json.encode({
                                              'service_id': 'service_t6f4bnl',
                                              'template_id': 'template_i3t487i',
                                              'user_id': 'Ic2DzVtFaiORvvn8A',
                                              'template_params': {
                                                'user_subject': isArabic() ? "طلب جديد" : "New Request",

                                                'title': isArabic() ? "طلب جديد من موقع شركة البناء الحديث" : "New Request from MCC Website",

                                                'user_data_label': isArabic() ? "بيانات العميل:" : "The Client Data:",
                                                
                                                'name_label': S.of(context).Name,
                                                'user_name': nameController.text,

                                                'email_label': S.of(context).Email,
                                                'user_email': emailController.text,
                                                
                                                'phone_label': S.of(context).Phone,
                                                'user_phone': phoneController.text,

                                                'service_label': S.of(context).Service,
                                                'user_service': selectedService,
                                                
                                                'message_label': S.of(context).Message,
                                                'user_message': messageController.text,
                                              },
                                            }),
                                          );
                                          statusCode = response.statusCode;
                                          validate_done = true;
                                          }
                                          
                                          if(validate_done)
                                          {
                                            if(statusCode == 200)
                                            {
                                              nameController.text = " ";
                                            emailController.text = " ";
                                            phoneController.text = " ";
                                            messageController.text = " ";
                                            showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(isArabic() ? "تم إرسال 'طلبك' بنجاح!" : "Your Request has been sent Successfully!",
                                                  style: const TextStyle(
                                                      fontFamily: "Alexandria"),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color.fromARGB(255, 39, 35, 51),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15)),
                                                        ),
                                                        child: Text(
                                                          isArabic() ? "حسناً" : "Okay",
                                                          style: const TextStyle(
                                                            fontFamily:"Alexandria",
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)),
                                              );
                                            });
                                          
                                            }
                                            else{
                                              showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(isArabic() ? "حدث خطأ! كود الحالة: $statusCode - حاول مرة أخرى" : "Error Occurred! Status Code: $statusCode - Try again",
                                                  style: const TextStyle(
                                                      fontFamily: "Alexandria"),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: const Color.fromARGB(255, 39, 35, 51),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15)),
                                                        ),
                                                        child: Text(
                                                          isArabic() ? "حسناً" : "Okay",
                                                          style: const TextStyle(
                                                            fontFamily:"Alexandria",
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)),
                                              );
                                            });
                                          
                                            }
                                          }

                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: primaryC3),
                                          child: Center(
                                              child: Text(
                                            S.of(context).Submit,
                                            style: const TextStyle(
                                                fontFamily: "Alexandria",
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20),
                                          )
                                              // child: defaultText(, 20,
                                              //     FontWeight.w400,
                                              //     color: Colors.white),
                                              ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                              ]),
                        ),
                      ),
                    ),
                    )
                    ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            /*ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: MOBILE),
                Condition.largerThan(name: TABLET),
              ],
              replacement: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .5,
                child: PageView.builder(
                  onPageChanged: (value) {
                    currentIndex = value;
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Image(
                          image: AssetImage(items[index]),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .5,
                        ),
                        Center(
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                    color: Colors.white,
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
                              count: items.length,
                              effect: const ExpandingDotsEffect(
                                  dotColor: Colors.white,
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
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .8,
                child: PageView.builder(
                  onPageChanged: (value) {
                    currentIndex = value;
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Image(
                          image: AssetImage(items[index]),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .8,
                        ),
                        Center(
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                    color: Colors.white,
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
                              count: items.length,
                              effect: const ExpandingDotsEffect(
                                  dotColor: Colors.white,
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
            ),*/
            MyFooter()
          ],
        ),
      ),
    );
  }
}
