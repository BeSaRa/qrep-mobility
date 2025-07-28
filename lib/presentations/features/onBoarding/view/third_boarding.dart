// import 'package:events_app/common/Util/slide_to_page_route.dart';
// import 'package:events_app/common/components/first_open/boading_widget.dart';
// import 'package:events_app/common/view/first_open/welcom_page.dart';
// import 'package:flutter/material.dart';
// import '../../../../core/constants/theme.dart';

// class ThirdBoading extends StatelessWidget {
//   const ThirdBoading({super.key});

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
//           boandingPageNumber: 3,
//           title: "Orgonaize your parties",
//           supTitle:
//               "You can organize your parties by booking lounges, organizers, and tickets",
//           image: "assets/images/third_boanding.png",
//         ));
//   }
// }
