import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_app/Screens/SettingsScreens/change_language_page.dart';
import 'package:first_app/Screens/SettingsScreens/change_password_page.dart';
import 'package:first_app/Screens/SettingsScreens/user_history_page.dart';
import 'package:first_app/Controllers/setting_controller.dart';
import 'package:first_app/Controllers/auth_controller.dart';
import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';
import 'package:first_app/utils/widgets/settings_widget.dart';
import 'package:first_app/utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final settingsController = Get.put(SettingsController());
  final logoutController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(
        title: 'Welcome\n ${currentUser.email}',
        automaticallyImplyLeading: false,
        height: 150,
        action: IconButton(
          onPressed: () {
            Get.bottomSheet(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: const BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              SizedBox(
                height: Get.height / 1.1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 15,),
                      const Text(
                        "Update User",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      const SizedBox(height: 15,),

                      TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.account_circle),
                            hintText: 'name'.tr,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            filled: true, 
                            // fillColor: Colors.white,
                          ),
                        // onChanged: (value) { _email = value; }
                      ),
                      const SizedBox(height: 15,),

                      TextField(
                          decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'email'.tr,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true, 
                          // fillColor: Colors.white,
                        ),
                        // onChanged: (value) { _email = value; }
                      ),
                      const SizedBox(height: 15,),

                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          hintText: 'phone-number'.tr,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true, 
                        ),
                        // onChanged: (value) { _phoneNumber = value; }
                      ),
                      const SizedBox(height: 25,),
                      TextButton(
                        onPressed: settingsController.pickImage,
                        child: const Center(
                          child: Text("Upload Image"),
                        ),
                      ),
                    ]
                  )
                )
              )
            );
          },
          icon: const Icon(Icons.edit),
        ),
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
                                  Obx(() => Icon(
                                    settingsController.isDarkModeOn.value ? Icons.nightlight_round : Icons.wb_sunny,
                                    color: Colors.white,
                                    size: 30,
                                  ),),
                                  Text(
                                    "dark-mode".tr,
                                    style: const TextStyle(
                                      color: Colors.white, 
                                      fontSize: 25
                                    ),
                                  ),
                                  Obx(
                                    () => Switch(
                                      value: settingsController.isDarkModeOn.value,
                                      onChanged: (value) {
                                        settingsController.toggleDarkMode(value);
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
                  const SizedBox(height: 20,),

                  SettingsWidget(
                    onTap: (() => Get.to(() => ChangePasswordScreen())),
                    label: "change-password".tr, 
                    icon: Icons.lock_outline, 
                    arrowIcon: Icons.keyboard_arrow_right,
                  ),
                  const SizedBox(height: 20,),

                  SettingsWidget(
                    onTap: (() => Get.to(() => ChangeLanguageScreen())),
                    label: "change-language".tr, 
                    icon: Icons.language, 
                    arrowIcon: Icons.keyboard_arrow_right,
                  ),
                  const SizedBox(height: 20,),

                  (currentUser.role == 'User')
                  ? SettingsWidget(
                    onTap: (){
                      // log("message");
                      settingsController.payWithKhalti(context);
                    },
                    label: "upgrade-to-premium".tr, 
                    icon: Icons.payment, 
                    arrowIcon: Icons.keyboard_arrow_right,
                  )
                  : SettingsWidget(
                    onTap: (() => Get.to(() => UserHistoryScreen())),
                    label: "mock-exam-history".tr, 
                    icon: Icons.history, 
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
