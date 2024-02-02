// import 'package:company_profile/home/presentation/widgets/ReadMore/readMore_body.dart';
// import 'package:flutter/material.dart';
// import 'package:hovering/hovering.dart';

// import '../social_contacts.dart';

// class ReadMoreScreen extends StatefulWidget {
//   ReadMoreScreen({super.key});

//   @override
//   State<ReadMoreScreen> createState() => _ReadMoreScreenState();
// }

// class _ReadMoreScreenState extends State<ReadMoreScreen> {
//   final List navigatorsScreen = [
//     "الرئيسية",
//     "عن الشركة",
//     "عملائنا",
//     "اعمالنا",
//     "خدماتنا"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         // bottomNavigationBar: Text("data"),
//         floatingActionButton: SocialContacts(),
//         backgroundColor: const Color.fromARGB(255, 223, 223, 223),
//         body: SingleChildScrollView(
//             child: Padding(
//           padding: const EdgeInsets.only(bottom: 8.0),
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 55),
//                 width: double.infinity,
//                 // color: Color.fromARGB(255, 39, 35, 51),
//                 height: 80,
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       "assets/images/agreement.png",
//                       width: 45,
//                       height: 45,
//                     ),
//                     Spacer(),
//                     Row(
//                       children: List.generate(navigatorsScreen.length, (index) {
//                         return InkWell(
//                           onTap: () {
//                             print(navigatorsScreen[index]);
//                           },
//                           child: HoverWidget(
//                             onHover: (event) {},
//                             child: Padding(
//                               padding:
//                                   EdgeInsets.only(top: 20, left: 20, right: 20),
//                               child: Text(
//                                 navigatorsScreen[index],
//                                 style: TextStyle(
//                                     // decoration: TextDecoration.underline,
//                                     fontSize: 16,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             hoverChild: Column(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       top: 20, left: 20, right: 20),
//                                   child: Text(
//                                     navigatorsScreen[index],
//                                     style: TextStyle(
//                                         // decoration: TextDecoration.underline,
//                                         fontSize: 16,
//                                         color: Color(0xffD19026),
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 42,
//                                   height: 1,
//                                   color: Color(0xffD19026),
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                     Spacer(),
//                     Row(
//                       // crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         SizedBox(
//                             width: 38,
//                             height: 38,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 padding: EdgeInsets.zero,
//                               ).copyWith(
//                                 shape: MaterialStateProperty.resolveWith<
//                                     RoundedRectangleBorder>(
//                                   (states) {
//                                     if (states
//                                         .contains(MaterialState.hovered)) {
//                                       return RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(18.0),
//                                           side: BorderSide(
//                                               color: Color(0xffD19026)));
//                                     }
//                                     return RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(18.0),
//                                         side: BorderSide(color: Colors.black));
//                                   },
//                                 ),
//                                 backgroundColor:
//                                     MaterialStateProperty.resolveWith<Color?>(
//                                         (states) {
//                                   if (states.contains(MaterialState.hovered)) {
//                                     return Color(0xffD19026);
//                                   }
//                                   return Colors.white;
//                                 }),
//                               ),
//                               onPressed: () {},
//                               child: CircleAvatar(
//                                 backgroundColor:
//                                     Color.fromARGB(28, 255, 255, 255),
//                                 child: Text(
//                                   "EN",
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ),
//                             )),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         SizedBox(
//                             height: 38,
//                             width: 150,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom().copyWith(
//                                 shape: MaterialStateProperty.resolveWith<
//                                     RoundedRectangleBorder>(
//                                   (states) {
//                                     if (states
//                                         .contains(MaterialState.hovered)) {
//                                       return RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(18.0),
//                                           side: BorderSide(
//                                               color: Color(0xffD19026)));
//                                     }
//                                     return RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(18.0),
//                                         side: BorderSide(color: Colors.black));
//                                   },
//                                 ),
//                                 backgroundColor:
//                                     MaterialStateProperty.resolveWith<Color?>(
//                                   (states) {
//                                     if (states
//                                         .contains(MaterialState.hovered)) {
//                                       return Color(0xffD19026);
//                                     }
//                                     return Colors.white;
//                                   },
//                                 ),
//                               ),
//                               onPressed: () {},
//                               child: Text(
//                                 "تواصل معنا",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               ReadMoreBody()
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }
