import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Screens/SettingsScreens/change_language_page.dart';
import 'package:first_app/Screens/SettingsScreens/change_password_page.dart';
import 'package:first_app/Screens/SettingsScreens/user_history_page.dart';
import 'package:first_app/Controllers/setting_controller.dart';
import 'package:first_app/Controllers/dark_mode_controller.dart';
import 'package:first_app/Controllers/auth_controller.dart';
import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';
import 'package:first_app/utils/widgets/settings_widget.dart';
import 'package:first_app/utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final settingsController = Get.put(SettingsController());
  final logoutController = Get.put(AuthController());
  final darkModeController = Get.put(DarkModeController());

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
                                    darkModeController.isDarkModeOn.value ? Icons.nightlight_round : Icons.wb_sunny,
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
                  const SizedBox(height: 20,),

                  SettingsWidget(
                    onTap: (() => Get.to(() => const ChangePasswordScreen())),
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




// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:week_one_project/components/app_button.dart';
// import 'package:week_one_project/controllers/category_controller.dart';
// import 'package:week_one_project/utils/messages.dart';

// class CategoryPage extends StatefulWidget {
//   const CategoryPage({super.key});

//   @override
//   State<CategoryPage> createState() => _CategoryPageState();
// }

// class _CategoryPageState extends State<CategoryPage> {
//   TextEditingController name = TextEditingController();
//   CategoryController categoryController = Get.put(CategoryController());
//   final _formKey = GlobalKey<FormState>();

//   final ImagePicker _picker = ImagePicker();

//   XFile? image;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height,
//       color: Colors.white,
//       child: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const Text(
//                   "Package",
//                   style: TextStyle(fontSize: 30),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: name,
//                   decoration: const InputDecoration(
//                     hintText: "Enter your Package",
//                     labelText: "Package",
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Field cannot be empty";
//                     }
//                     return null;
//                   },
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     image =
//                         await _picker.pickImage(source: ImageSource.gallery);
//                     setState(() {});
//                   },
//                   child: SizedBox(
//                     height: 200,
//                     width: 200,
//                     child: image != null
//                         ? Image.file(
//                             File(image!.path),
//                             fit: BoxFit.cover,
//                           )
//                         : Image.network(
//                             "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"),
//                   ),
//                 ),
//                 Container(
//                   child: categoryController.isLoading.value
//                       ? const CircularProgressIndicator()
//                       : AppButton(
//                           label: "Add",
//                           onPressed: () {
//                             var isValid = _formKey.currentState!.validate();

//                             if (image == null) {
//                               errorMessage("File not provided");
//                             }
//                             if (isValid) {
//                               var data = {'name': name.text};
//                               categoryController.submit(
//                                   data: data, image: File(image!.path));
//                             }
//                           },
//                           width: Get.width,
//                         ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }