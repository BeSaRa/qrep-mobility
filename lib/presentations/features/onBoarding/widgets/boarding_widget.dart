// import 'package:ebla/presentations/resources/color_manager.dart';
// import 'package:ebla/presentations/resources/values_manager.dart';
// import 'package:flutter/material.dart';

// class BoardingWidget extends StatelessWidget {
//   const BoardingWidget({
//     super.key,
//     required this.title,
//     this.supTitle,
//     required this.viewContent,
//     required this.boandingPageNumber,
//   });

//   final String title;
//   final String? supTitle;
//   final Widget viewContent;
//   final int boandingPageNumber;
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       //1
//       Container(
//           padding: EdgeInsets.only(bottom: AppSizeH.s15),
//           child: Text(
//             title,
//             style: Theme.of(context).textTheme.bodyLarge,
//           )),
//       if (supTitle != null)
//         Container(
//             padding: EdgeInsets.only(bottom: AppSizeH.s25),
//             child: Text(
//               supTitle!,
//               style: Theme.of(context).textTheme.bodyMedium,
//             )),
//       SizedBox(height: AppSizeH.s20),
//       //2
//       Expanded(child: viewContent),
//       //3
//       SizedBox(height: AppSizeH.s50),
//       // const Spacer(),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(5, (index) {
//                   bool isActive = boandingPageNumber == index + 1;
//                   return AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     margin: EdgeInsets.symmetric(
//                         horizontal: index != 0 ? AppSizeW.s4 : AppSizeW.s0),
//                     width: isActive ? 20 : 6,
//                     height: 6,
//                     decoration: BoxDecoration(
//                       color: isActive
//                           ? ColorManager.white
//                           : ColorManager.silver.withValues(alpha: .5),
//                       borderRadius: BorderRadius.circular(3),
//                     ),
//                   );
//                 }),
//               ),
//               SizedBox(height: AppSizeH.s16),
//               GestureDetector(
//                 onTap: () {
//                   //Navigator.pop(context)
//                   if (boandingPageNumber == 1) {
//                     // Navigator.push(
//                     //   context,
//                     //   SlidToPage(
//                     //     page: const SplashPage(),
//                     //     onComplete: () {
//                     //       Navigator.pushReplacement(
//                     //           context,
//                     //           MaterialPageRoute(
//                     //               builder: (context) => const SplashPage()));
//                     //     },
//                     //   ),
//                     // );
//                   } else if (boandingPageNumber == 2) {
//                     // Navigator.push(
//                     //   context,
//                     //   SlidToPage(
//                     //     page: const FirstBoading(),
//                     //     onComplete: () {
//                     //       Navigator.pushReplacement(
//                     //           context,
//                     //           MaterialPageRoute(
//                     //               builder: (context) => const FirstBoading()));
//                     //     },
//                     //   ),
//                     // );
//                   } else {
//                     // Navigator.push(
//                     //   context,
//                     //   SlidToPage(
//                     //     page: const SecondBoading(),
//                     //     onComplete: () {
//                     //       Navigator.pushReplacement(
//                     //         context,
//                     //         MaterialPageRoute(
//                     //           builder: (context) => const SecondBoading(),
//                     //         ),
//                     //       );
//                     //     },
//                     //   ),
//                     // );
//                   }
//                 },
//                 child: Text(
//                   "Skip",
//                   style: Theme.of(context).textTheme.displaySmall,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(width: AppSizeW.s50),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () {
//                 if (boandingPageNumber == 1) {
//                   // Navigator.push(
//                   //   context,
//                   //   SlidToPage(
//                   //     page: const SecondBoading(),
//                   //     onComplete: () {
//                   //       Navigator.pushReplacement(
//                   //           context,
//                   //           MaterialPageRoute(
//                   //               builder: (context) => const SecondBoading()));
//                   //     },
//                   //   ),
//                   // );
//                 } else if (boandingPageNumber == 2) {
//                   // Navigator.push(
//                   //   context,
//                   //   SlidToPage(
//                   //     page: const ThirdBoading(),
//                   //     onComplete: () {
//                   //       Navigator.pushReplacement(
//                   //           context,
//                   //           MaterialPageRoute(
//                   //               builder: (context) => const ThirdBoading()));
//                   //     },
//                   //   ),
//                   // );
//                 } else {
//                   // //here we will go to Welcome Page
//                   // Navigator.pushReplacement(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => const WelcomPage()));
//                 }
//               },
//               style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
//                     backgroundColor:
//                         WidgetStateProperty.all(ColorManager.white),
//                     textStyle: WidgetStatePropertyAll(
//                       TextStyle(
//                         color: ColorManager.primary,
//                       ),
//                     ),
//                   ),
//               child: Text(boandingPageNumber != 5 ? "NEXT" : "GET STARTED",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium
//                       ?.copyWith(color: ColorManager.primary)),
//             ),
//           ),
//         ],
//       )
//     ]);
//   }
// }
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:ebla/presentations/resources/values_manager.dart';

class BoardingWidget extends StatelessWidget {
  final String title;
  final String? supTitle;
  final Widget viewContent;
  final int totalPages;
  final int currentIndex;

  const BoardingWidget({
    super.key,
    required this.title,
    required this.supTitle,
    required this.viewContent,
    required this.totalPages,
    required this.currentIndex,
  });

  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Title
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: currentIndex == 4 ? AppSizeW.s20 : 0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : ColorManager.primary),
        ),
      ),
      SizedBox(height: AppSizeH.s8),
      if (supTitle != null)
        Text(
          supTitle!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : ColorManager.primary),
        ),
      SizedBox(height: AppSizeH.s40),
      // Content
      viewContent,
    ]);
  }
}
