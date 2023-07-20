import 'package:auth/src/constants/colors.dart';
import 'package:auth/src/constants/sizes.dart';
import 'package:auth/src/constants/text_strings.dart';
import 'package:auth/src/features/authentication/screens/notifications/notifications.dart';
import 'package:auth/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:auth/src/features/authentication/screens/profile/widgets/profile_menu.dart';
import 'package:auth/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../helpline/helpline_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark;
    return ScaffoldGradientBackground(
      gradient: LinearGradient(colors: [
        Color(0xFF8EC5FC),
        Color(0xFFE0C3FC),
      ]),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),

        ),
        title: Text("Profile", style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              // Stack(
              //   children: [
              //     SizedBox(
              //       width: 120,
              //       height: 120,
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(100),
              //         child: Icon(Icons.person),
              //       ),
              //     ),
              //     Positioned(
              //       bottom: 0,
              //       right: 0,
              //       child: Container(
              //           width: 35,
              //           height: 35,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(100),
              //             color: tPrimaryColor,
              //           ),
              //           child: Icon(
              //             LineAwesomeIcons.alternate_pencil,
              //             size: 20.0,
              //           )),
              //     )
              //   ],
              // ),
              SizedBox(
                height: 10,
              ),
              Text(
                tProfileHeading,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall,
              ),
              Text(tProfileSubHeading,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  child: Text(tEditProfile),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: StadiumBorder()),
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 10),
              // ProfileMenuWidget(
              //   title: 'Edit Created Profile',
              //   icon: Icons.edit,
              //   onPress: () {
              //     Get.to(() => ViewFormScreen(userId: '', documentId: '',));
              //   },
              //   endIcon: false,
              // ),
              // ProfileMenuWidget(
              //   title: 'Notifications',
              //   icon: Icons.notifications,
              //   onPress: () {
              //     Get.to(() => NotificationScreen());
              //   },
              //   endIcon: false,
              //   ),
              // ProfileMenuWidget(
              //   title: 'Reminders',
              //   icon: Icons.notification_add_outlined,
              //   onPress: () {
              //     Get.to(() => ReminderScreen());
              //   },
              //   endIcon: false,
              // ),

              //ProfileMenuWidget(title: 'Terms & Conditions', icon: Icons.add_alert, onPress: () {  }, endIcon: false, ),
              ProfileMenuWidget(
                title: 'Hotline/HelpLine',
                icon: Icons.add_alert,
                onPress: () {
                  Get.to(() => HelplineScreen());
                },
                endIcon: false,
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 10),
              ProfileMenuWidget(
                title: 'Logout',
                textColor: Colors.red,
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {
                  AuthenticationRepository.instance.logout();
                },
                endIcon: false,
              ),

              //     AuthenticationRepository.instance.logout();
            ],
          ),
        ),
      ),
    );
  }

}
