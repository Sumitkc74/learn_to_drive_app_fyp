import 'dart:developer';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:first_app/Models/tutorial_model.dart';
import 'package:first_app/Services/repo/tutorial_repo.dart';

class TutorialController extends GetxController {
  final  tutorials = <Tutorial>[];  
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllTutorials();
    super.onInit();
  }

  getAllTutorials() async {
    loading.value = true;
    await TutorialRepo.getTutorial(
      onSuccess: (tutorial) {
        loading.value = false;
        tutorials.addAll(tutorial);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }

  Future<void> launchInBrowser(String url) async {
    try {
      final Uri toLaunch = Uri.parse(url);
      await launchUrl(toLaunch, mode: LaunchMode.externalApplication);
    } catch (e) {
      log("couldnot launch ------->");
    }
  }
}
