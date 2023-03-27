import 'dart:developer';
import 'package:first_app/Services/Repo/exam_information_repo.dart';
import 'package:first_app/Models/exam_information.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ExamInformationController extends GetxController {
  RxList<ExamInformation> examInformations = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllExamInformations();
    super.onInit();
  }

  getAllExamInformations() async {
    loading.value = true;
    await ExamInformationRepo.getExamInformation(
      onSuccess: (examInformation) {
        loading.value = false;

        examInformations.addAll(examInformation);
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
