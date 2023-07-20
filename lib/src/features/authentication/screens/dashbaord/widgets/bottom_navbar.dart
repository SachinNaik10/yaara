// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
//
// import '../../controllers/navbar_controller.dart';
// import '../Fitness/fitness.dart';
// import '../calender/calender.dart';
// import '../dashbaord/dashboard.dart';
// import '../health/health.dart';
//
// class MainPage extends StatelessWidget {
//   MainPage({Key? key}) : super(key: key);
//   final NavbarWrapperController controller = Get.put(NavbarWrapperController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: controller.pageController,
//         physics: BouncingScrollPhysics(),
//         children: [
//           Dashboard(),
//           HealthPage(),
//           FitnessPage(),
//           Calender(),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         notchMargin: 10,
//         elevation: 0,
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _bottomAppBarItem(context,
//                   icon: Icon(
//                     LineIcons.home,
//                   ),
//                   page: 0,
//                   label: "Home"),
//               _bottomAppBarItem(context,
//                   icon: Icon(
//                     LineIcons.heart,
//                   ),
//                   page: 1,
//                   label: "Health"),
//               _bottomAppBarItem(context,
//                   icon: Icon(
//                     LineIcons.barChart,
//                   ),
//                   page: 2,
//                   label: "Fitness"),
//               _bottomAppBarItem(context,
//                   icon: Icon(
//                     LineIcons.calendar,
//                   ),
//                   page: 3,
//                   label: "Calender"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _bottomAppBarItem(BuildContext context,
//       {required icon, required page, required label}) {
//     return ZoomTapAnimation(
//       onTap: () => controller.goToTab(page),
//       child: Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [Icon(icon), Text(label)],
//         ),
//       ),
//     );
//   }
// }
