import 'package:first_app/Controllers/user_history_controller.dart';
import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/Models/user_history_model.dart';
import 'package:first_app/Screens/SettingsScreens/individual_user_history_page.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHistoryScreen extends StatelessWidget {
  UserHistoryScreen({super.key});

  final userHistoryController = Get.put(GetUserHistoryController());

  @override
  Widget build(BuildContext context) {
    final currentUserHistories = userHistoryController.userHistories.where((history) => history.userId == currentUser.id);
    return Scaffold(
      appBar: ScreensAppBar(
        title: 'user-history'.tr, 
        onPressed: (){
          Get.back();
        }
      ),
      
      body: Obx(
        () => (userHistoryController.loading.value)
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height,
                  width: Get.width, 
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: currentUserHistories.length,
                    itemBuilder: (context,index){ 
                      UserHistory userHistory = currentUserHistories.toList()[currentUserHistories.length - 1 - index];
                      return  Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(IndividualUserHistory(userHistory: userHistory,));
                          },
                          child: Card(
                            elevation: 4,
                            child: ListTile(
                              leading: const Icon(Icons.campaign,size: 26,),
                              title: Text(
                                "Question History ${userHistory.id}",
                                style: const TextStyle(
                                  fontWeight:FontWeight.bold,fontSize: 18
                                ),
                              ),
                              subtitle: Text(
                                userHistory.updatedAt??"",
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ),
                        )
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}