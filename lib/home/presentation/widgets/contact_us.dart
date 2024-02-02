import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';
import 'package:company_profile/home/data/model/clientsModel.dart';
import 'package:company_profile/home/presentation/widgets/navBar/content_navbar.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/defaultTextField.dart';
import 'package:company_profile/home/presentation/widgets/differentWidgets/text_overImage.dart';
import 'package:company_profile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import 'footer.dart';

// ignore: must_be_immutable
class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  

  final items = [
    "assets/images/tools.png",
    "assets/images/tools.png",
    "assets/images/building3.png",
    "assets/images/building4.png",
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();
  String selectedService = isArabic() ? "بدون خدمة" : "None";
  int statusCode = -1;
  bool validate_done = false;
  final TextEditingController messageController = TextEditingController();

  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var cubit = BrokerCubit.get(context);
    final List<String> serviceListForm = [S.of(context).None,S.of(context).Service1,S.of(context).Service2,S.of(context).Service3,S.of(context).Service4];
    final List<ClientsModel> contactData = [
    ClientsModel(
        image: "assets/images/phone.png",
        description: "+966 560031111 -  920004768"),
    ClientsModel(
        image: "assets/images/letter.png", description: "info@ModernCo.com"),
    ClientsModel(
        image: "assets/images/map.png",
        description: S.of(context).Address),
  ];
  final List<ClientsModel> contactData2 = [
    ClientsModel(
        image: "assets/images/phone.png",
        description: "+966 560031111 -  920004768"),
    ClientsModel(
        image: "assets/images/letter.png", description: "info@ModernCo.com"),
    ClientsModel(
        image: "assets/images/map.png",
        description: S.of(context).AddressPhone),
  ];
    return BlocBuilder<BrokerCubit, BrokerStates>(
        builder: (context, state) => ResponsiveVisibility(
          visible: false,
          visibleWhen: const [
            Condition.largerThan(name: MOBILE),
            Condition.largerThan(name: TABLET)
          ],
          replacement: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextOverImage(
                    title: S.of(context).ContactUs,
                    subTitle:
                        S.of(context).ContactUsDesc,
                    image: "assets/images/contactbg.png"),
                ContentNavBar(
                    navcontent: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: defaultText(S.of(context).ContactUs, 12, FontWeight.w500,
                      color: primaryC2),
                ), shadowAppear: true,),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 7,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * .9,
                              child: Column(
                                children: [
                                  Center(
                                    child: defaultText(
                                        S.of(context).MainBranch, 20, FontWeight.w600,
                                        color: primaryC3),
                                  ),
                                  Column(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          children: List.generate(
                                              contactData2.length, (index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.white,
                                                      border: Border.all(
                                                          color: const Color(0xff979797)),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Image.asset(
                                                        contactData2[index].image,
                                                        width: 8,
                                                        height: 8,
                                                        fit: BoxFit.fitHeight,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(8),
                                                      child: defaultText(
                                                          contactData2[index]
                                                              .description,
                                                          16,
                                                          FontWeight.w500,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          width: MediaQuery.of(context).size.width *
                                              .8,
                                          // alignment: Alignment.bottomRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(S.of(context).MailBox, 12,
                                                  FontWeight.w400),
                                              defaultText(S.of(context).PostalCode,
                                                  12, FontWeight.w400),
                                            ],
                                          ),
                                        )
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.white,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width * 1,
                                child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: defaultText(
                                          S.of(context).WeHappy, 20,
                                          FontWeight.w400,
                                          // color: Colors.white
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(
                                            text: TextSpan(
                                                style: const TextStyle(
                                                  fontFamily: "Alexandria",
                                                  color: primaryC1,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                text: S.of(context).From,
                                                children: [
                                              TextSpan(
                                                text: S.of(context).Sunday,
                                                style: const TextStyle(
                                                  fontFamily: "Alexandria",
                                                  color: primaryC3,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: S.of(context).To,
                                                style: const TextStyle(
                                                  fontFamily: "Alexandria",
                                                  color: primaryC1,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: S.of(context).Thursday,
                                                style: const TextStyle(
                                                  fontFamily: "Alexandria",
                                                  color: primaryC3,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ])),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(
                                            text: TextSpan(
                                                style: const TextStyle(
                                                  fontFamily: "Alexandria",
                                                  color: primaryC1,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                text: S.of(context).FromHour,
                                                children: [
                                              TextSpan(
                                                text: S.of(context).Hour8Am,
                                                style: const TextStyle(
                                                  fontFamily: "Alexandria",
                                                  color: primaryC3,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: S.of(context).To,
                                                style: const TextStyle(
                                                  fontFamily: "Alexandria",
                                                  color: primaryC1,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: S.of(context).Hour5Pm,
                                                style: const TextStyle(
                                                  fontFamily: "Alexandria",
                                                  color: primaryC3,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ])),
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * .9,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: defaultText(
                                      S.of(context).ContactUs, 20, FontWeight.w600,
                                      color: primaryC3),
                                ),
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
                                    // MediaQuery.of(context).size.width>800?
                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       child: Padding(
                                    //         padding: const EdgeInsets.symmetric(
                                    //             vertical: 6, horizontal: 4),
                                    //         child: DefaultTextField(
                                    //             controller: phoneController,
                                    //             prefix:
                                    //                 Icon(Icons.phone_enabled),
                                    //             labelText: "الجوال"),
                                    //       ),
                                    //     ),
                                    //     Expanded(
                                    //       child: Padding(
                                    //         padding: const EdgeInsets.symmetric(
                                    //             vertical: 6, horizontal: 4),
                                    //         child: DefaultTextField(
                                    //             controller: emailController,
                                    //             prefix: Icon(Icons.email),
                                    //             labelText: "البريد الالكتروني"),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                      child: DropdownButtonFormField<String>(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      value: serviceListForm[0],
                                      
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
                                                title: Text(isArabic() ? "تم إرسال رسالتك بنجاح!" : "Your Message has been sent Successfully!",
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
                                              color: primaryC4),
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  "assets/images/location.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                MyFooter()
              ],
            ),
          ),
          
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextOverImage(
                    title: S.of(context).ContactUs,
                    subTitle:
                        S.of(context).ContactUsDesc,
                    image: "assets/images/contactbg.png"),
                ContentNavBar(
                    navcontent: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: defaultText(S.of(context).ContactUs, 16, FontWeight.w500,
                      color: primaryC2),
                ), shadowAppear: true,),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.white,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                width:
                                    //  600,
                                    MediaQuery.of(context).size.width * .45,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: defaultText(
                                        S.of(context).MainBranch, 28, FontWeight.w600,
                                        color: primaryC3),
                                  ),),
                                    Column(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          
                                          Column(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            children: List.generate(
                                                contactData.length, (index) {
                                              return Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                        // color: Colors.white,
                                                        border: Border.all(
                                                            color:
                                                                const Color(0xff979797)),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8.0),
                                                        child: Image.asset(
                                                          contactData[index].image,
                                    
                                                          // width: 8,
                                                          // height: 8,
                                                          fit: BoxFit.fitHeight,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets.all(8),
                                                        child: defaultText(
                                                            contactData[index]
                                                                .description,
                                                            16,
                                                            FontWeight.w500,
                                                            color: Colors.black)),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                          
                                        ]),
                                  Container(
                                            padding: const EdgeInsets.all(11),
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    .3,
                                            // alignment: Alignment.bottomRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                defaultText(S.of(context).MailBox, 12,
                                                    FontWeight.w400),
                                                const Spacer(),
                                                defaultText(S.of(context).PostalCode,
                                                    12, FontWeight.w400),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Card(
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.white,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width * .45,
                                // width: 600,

                                child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: defaultText(
                                              S.of(context).WeHappy, 20, FontWeight.w400,
                                              // color: Colors.white
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RichText(
                                                text: TextSpan(
                                                    style: const TextStyle(
                                                      fontFamily: "Alexandria",
                                                      color: primaryC1,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    text: S.of(context).From,
                                                    children: [
                                                  TextSpan(
                                                    text: S.of(context).Sunday,
                                                    style: const TextStyle(
                                                      fontFamily: "Alexandria",
                                                      color: primaryC3,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: S.of(context).To,
                                                    style: const TextStyle(
                                                      fontFamily: "Alexandria",
                                                      color: primaryC1,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: S.of(context).Thursday,
                                                    style: const TextStyle(
                                                      fontFamily: "Alexandria",
                                                      color: primaryC3,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  )
                                                ])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RichText(
                                                text: TextSpan(
                                                    style: const TextStyle(
                                                      fontFamily: "Alexandria",
                                                      color: primaryC1,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    text: S.of(context).FromHour,
                                                    children: [
                                                  TextSpan(
                                                    text: S.of(context).Hour8Am,
                                                    style: const TextStyle(
                                                      fontFamily: "Alexandria",
                                                      color: primaryC3,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: S.of(context).To,
                                                    style: const TextStyle(
                                                      fontFamily: "Alexandria",
                                                      color: primaryC1,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: S.of(context).Hour5Pm,
                                                    style: const TextStyle(
                                                      fontFamily: "Alexandria",
                                                      color: primaryC3,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  )
                                                ])),
                                          ),
                                        ]),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Card(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * .45,
                            // width: 600,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: defaultText(
                                        S.of(context).ContactUs, 28, FontWeight.w600,
                                        color: primaryC3),
                                  ),
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
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6,
                                                      horizontal: 4),
                                              child: DefaultTextField(
                                                  controller: phoneController,
                                                  prefix:
                                                      const Icon(Icons.phone_enabled),
                                                  labelText: S.of(context).Phone),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6,
                                                      horizontal: 4),
                                              child: DefaultTextField(
                                                  controller: emailController,
                                                  prefix: const Icon(Icons.email),
                                                  labelText:
                                                      S.of(context).Email),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                      child: DropdownButtonFormField<String>(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(fontSize: 12, fontFamily: "Alexandria"),
                                      value: serviceListForm[0],
                                      
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
                                                title: Text(isArabic() ? "تم إرسال رسالتك بنجاح!" : "Your Message has been sent Successfully!",
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
                                                color: primaryC4),
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
                        )
                      ],
                    ),
                  ),
                  //   ],
                  // ),
                ),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  "assets/images/location.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                MyFooter()
              ],
            ),
          ),
        ),
      );
  }
}
