// import 'package:auth/src/constants/colors.dart';
// import 'package:auth/src/constants/image_strings.dart';
// import 'package:auth/src/constants/sizes.dart';
// import 'package:auth/src/constants/text_strings.dart';
// import 'package:auth/src/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
// import 'package:auth/src/features/authentication/screens/welcome/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../../models/model_on_boarding.dart';
//
// class OnBoardingScreen extends StatefulWidget {
//   OnBoardingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   final controller = LiquidController();
//
//   int currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final pages = [
//
//       OnBoardingPageWidget(
//           model: OnBoardingModel(
//         image: tOnBoardingImage1,
//         // title: tOnBoardingTitle1,
//         // subTitle: tOnBoardingSubTitle1,
//         // // CounterText: tOnBoardingCounter1,
//         // bgColor: tOnBoardingPage1Color,
//         height: size.height,
//       )),
//       OnBoardingPageWidget(
//           model: OnBoardingModel(
//         image: tOnBoardingImage2,
//         // title: tOnBoardingTitle2,
//         // subTitle: tOnBoardingSubTitle2,
//         // // CounterText: tOnBoardingCounter2,
//         // bgColor: tOnBoardingPage2Color,
//         height: size.height,
//       )),
//       OnBoardingPageWidget(
//           model: OnBoardingModel(
//         image: tOnBoardingImage3,
//         // title: tOnBoardingTitle3,
//         // subTitle: tOnBoardingSubTitle3,
//         // // CounterText: tOnBoardingCounter3,
//         // bgColor: tOnBoardingPage3Color,
//         height: size.height,
//       )),
//     ];
//
//     return ScaffoldGradientBackground(
//       gradient: LinearGradient(colors: [
//         Color(0xFFE0C3FC),
//         Color(0xFF8EC5FC),
//       ]),
//       body: Stack(
//         alignment: Alignment.centerLeft,
//         children: [
//           LiquidSwipe(
//             pages: pages,
//             liquidController: controller,
//             slideIconWidget: Icon(Icons.arrow_back_ios_new),
//             enableSideReveal: true,
//             onPageChangeCallback: onPageChangedCallback,
//           ),
//           Positioned(
//               bottom: 60.0,
//               child: OutlinedButton(
//                 onPressed: () {
//                   int nextPage = controller.currentPage + 1;
//                   controller.animateToPage(page: nextPage);
//                 },
//                 style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     side: const BorderSide(color: Colors.black26),
//                     shape: const CircleBorder(),
//                     padding: const EdgeInsets.all(05)),
//                 child: Container(
//                   padding: const EdgeInsets.all(tDefaultSize),
//                   decoration: const BoxDecoration(
//                       color: tDarkColor, shape: BoxShape.circle),
//                   child: Icon(Icons.arrow_forward_ios),
//                 ),
//               )),
//           Positioned(
//               top: 50,
//               right: 20,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                         builder: (context) => const WelcomeScreen()),
//                   );
//                 }, //controller.jumpToPage(page: 2)
//                 child: const Text(
//                   "skip",
//                   softWrap: true,
//                   style: TextStyle(color: Colors.deepPurple),
//                 ),
//               )),
//           Positioned(
//               bottom: 10,
//               child: AnimatedSmoothIndicator(
//                 activeIndex: controller.currentPage,
//                 effect: const WormEffect(
//                   activeDotColor: Color(0xff272727),
//                   dotHeight: 5.0,
//                 ),
//                 count: 3,
//               ))
//         ],
//       ),
//     );
//   }
//
//   void onPageChangedCallback(int activePageIndex) {
//     setState(() {
//       currentPage = activePageIndex;
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../welcome/welcome_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/onboarding_images/activity.png',
    'assets/images/onboarding_images/calender.png',
    'assets/images/onboarding_images/pmood.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePaths[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        color: Color(0xfffddcdf),
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _skipOnboarding(context);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,

                ),
              ),

            ),

          ],
        ),
      ),
    );
  }

  void _skipOnboarding(BuildContext context) {
    // TODO: Handle skip button action
    // For example, navigate to the home screen
    Get.to(() => WelcomeScreen());
  }


}
