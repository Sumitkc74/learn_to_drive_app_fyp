import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Controllers/dark_mode_controller.dart';
import 'package:first_app/Controllers/auth_controller.dart';
import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';
import 'package:first_app/utils/widgets/settings_widget.dart';
import 'package:first_app/utils/colors.dart';

import 'package:first_app/Screens/SettingsScreens/change_language.dart';
import 'package:first_app/Screens/SettingsScreens/change_password.dart';
import 'package:first_app/Screens/SettingsScreens/notifications.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final logoutController = Get.put(AuthController());
  final darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(
        title: 'Welcome\n ${currentUser.email}',
        automaticallyImplyLeading: false,
        height: 150,
      ),
      
      body: Stack(
        children: [
          SingleChildScrollView(
            child:Container( 
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),

                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.shadowBlack,
                        child: SizedBox(
                          height: 80,
                            width: Get.width/1.15,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: [
                                  Icon(
                                    darkModeController.isDarkModeOn.value ? Icons.wb_sunny : Icons.nightlight_round,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "dark-mode".tr,
                                    style: const TextStyle(
                                      color: Colors.white, 
                                      fontSize: 25
                                    ),
                                  ),
                                  Obx(
                                    () => Switch(
                                      value: darkModeController.isDarkModeOn.value,
                                      onChanged: (value) {
                                        darkModeController.toggleDarkMode(value);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            )
                        ),
                      ),
                    ],
                  ),
                  // SettingsWidget(
                  //   label: "dark-mode".tr, 
                  //   icon: darkModeController.isDarkModeOn.value 
                  //     ? Icons.wb_sunny 
                  //     : Icons.nightlight_round,
                  //   obx: Obx(
                  //     () => Switch(
                  //       value: darkModeController.isDarkModeOn.value,
                  //       onChanged: (value) {
                  //         darkModeController.toggleDarkMode(value);
                  //       },
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 20,),

                  SettingsWidget(
                    onTap: (() => Get.to(() => NotificationsScreen())),
                    label: "notifications".tr, 
                    icon: Icons.notifications_outlined, 
                    arrowIcon: Icons.keyboard_arrow_right,
                  ),
                  const SizedBox(height: 20,),

                  SettingsWidget(
                    onTap: (() => Get.to(() => const ChangePasswordScreen())),
                    label: "change-password".tr, 
                    icon: Icons.lock_outline, 
                    arrowIcon: Icons.keyboard_arrow_right,
                  ),
                  const SizedBox(height: 20,),

                  SettingsWidget(
                    onTap: (() => Get.to(() => const ChangeLanguageScreen())),
                    label: "change-language".tr, 
                    icon: Icons.language, 
                    arrowIcon: Icons.keyboard_arrow_right,
                  ),
                  const SizedBox(height: 20,),

                  SettingsWidget(
                    onTap: () => logoutController.logout(),
                    label: "logout".tr, 
                    icon: Icons.logout, 
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}