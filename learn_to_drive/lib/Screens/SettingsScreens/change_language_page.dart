import 'package:first_app/Controllers/setting_controller.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends StatelessWidget {
  ChangeLanguageScreen({super.key});
  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: ScreensAppBar(
        title: 'change-language'.tr,
        onPressed: (){
          Get.back();
        }
      ),

      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'available-language'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          // color: Colors.white,
                        ),
                      ),
                    ),
            const SizedBox(height: 40,),
            const Divider(
              color: Colors.grey,
            ),

            InkWell(
              onTap: () {
                var locale = const Locale('en','US');
                Get.updateLocale(locale);
                settingsController.isEnglish = true; // Update the observable variable
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'english'.tr,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: settingsController.isEnglish, // Use the observable variable to control visibility
                      child: Icon(
                        Icons.check,
                        size: 28,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ]
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            InkWell(
              onTap: () {
                var locale = const Locale('ne','NP');
                Get.updateLocale(locale);
                settingsController.isEnglish = false; // Update the observable variable
              },
              child: SizedBox(
                height: 48,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'nepali'.tr,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !settingsController.isEnglish, // Use the observable variable to control visibility
                        child: Icon(
                          Icons.check,
                          size: 28,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ]),
              ),
            ),
            const Divider(
              color: Colors.grey
            ),
        ] 
      )))
    );
  }
}
