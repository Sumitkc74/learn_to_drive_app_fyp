import 'dart:developer';
import 'package:first_app/Services/repo/exam_information_repo.dart';
import 'package:first_app/Models/exam_information_model.dart';
import 'package:get/get.dart';

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
}
