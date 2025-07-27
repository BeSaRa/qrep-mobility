// import 'package:events_app/common/Util/slide_to_page_route.dart';
// import 'package:events_app/common/components/first_open/boading_widget.dart';
// import 'package:events_app/common/core/constants/theme.dart';
// import 'package:events_app/common/view/first_open/welcom_page.dart';
// import 'package:flutter/material.dart';

// class SecondBoading extends StatelessWidget {
//   const SecondBoading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ThemesStyles.background,
//         appBar: AppBar(
//           title: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   SlidToPage(
//                     page: const WelcomPage(),
//                     onComplete: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const WelcomPage()));
//                     },
//                   ),
//                 );
//               },
//               child: const Text("SKIP")),
//           titleTextStyle:
//               const TextStyle(color: Color(0xff464646), fontSize: 16),
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           elevation: 0.0,
//         ),
//         // u can find BoadingWidget() in lib\widgets\first_open
//         body: const BoadingWidget(
//           boandingPageNumber: 2,
//           title: "Create Craetive event",
//           supTitle:
//               "In Eventopia you can create your personalized wedding, party, and event to more achieving",
//           image: "assets/images/second_boanding.png",
//         ));
//   }
// }
