import 'package:auth/src/constants/sizes.dart';
import 'package:auth/src/constants/text_strings.dart';
import 'package:auth/src/features/authentication/screens/Fitness/fitness.dart';
import 'package:auth/src/features/authentication/screens/calender/calender.dart';
import 'package:auth/src/features/authentication/screens/dashbaord/widgets/appbar.dart';
import 'package:auth/src/features/authentication/screens/dashbaord/widgets/banners.dart';
import 'package:auth/src/features/authentication/screens/dashbaord/widgets/bottom_navbar.dart';
import 'package:auth/src/features/authentication/screens/dashbaord/widgets/categories.dart';
import 'package:auth/src/features/authentication/screens/dashbaord/widgets/top_courses.dart';
import 'package:auth/src/features/authentication/screens/health/health.dart';
import 'package:auth/src/features/notification_services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.getDeviceToken().then((value){
      print("device token");
      print(value);
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: ScaffoldGradientBackground(
          gradient: LinearGradient(colors: [
            Color(0xFF8EC5FC),
            Color(0xFFE0C3FC),
          ]),
      appBar: DashboardAppBar(),
      body: SingleChildScrollView(

        child: Container(
          padding: EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tDashbaordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                tDashbaordHeading,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: tDashboardPadding,
              ),

//ChatBot search
//               Container(
//                 decoration:
//                     BoxDecoration(border: Border(left: BorderSide(width: 4))),
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       tDashbaordSearch,
//                       textAlign: TextAlign.left,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineMedium
//                           ?.apply(color: Colors.grey.withOpacity(0.5)),
//                     ),
//                     Icon(
//                       Icons.send,
//                       size: 25,
//                     )
//                   ],
//                 ),
//               ),
              SizedBox(
                height: tDashboardPadding,
              ),
//WATCH VIDEO FROM 30MINS FOR BUILDER METHOD ONCE DESIGNED CREATE MODEL
//categories
              CategoriesWidget(),
              SizedBox(
                height: tDashboardPadding,
              ),

//bannerr
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: tCardBgColor),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: Icon(Icons.bookmark_add_outlined)),
                              Flexible(child: Icon(Icons.badge_outlined)),
//add BAnner image
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            tDashbaordBannerTitle1,
                            style: Theme.of(context).textTheme.headlineSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            tDashbaordBannerSubTitle,
                            style: Theme.of(context).textTheme.headlineSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tCardBgColor),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      child: Icon(Icons.bookmark_add_outlined)),
                                  Flexible(child: Icon(Icons.badge_outlined)),
//add BAnner image
                                ],
                              ),
                              Text(
                                tDashbaordBannerTitle1,
                                style: Theme.of(context).textTheme.bodyLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                tDashbaordBannerSubTitle,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                                onPressed: () {},
                                child: Text(tDashbaordButton))),
                      ],
                    ),
                  ),
                ],
              ),
              Banners(),
//TOPcourses
              Text(tDashbaordTopCourses,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.apply(fontSizeFactor: 1.2)),
              TopCourses(),
            ],
          ),
        ),
      ),
    ));
  }
}
