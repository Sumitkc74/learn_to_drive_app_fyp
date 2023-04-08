import 'dart:developer';
import 'package:get/get.dart';
import 'package:first_app/Services/repo/exam_paper_repo.dart';
import 'package:first_app/Models/exam_paper_model.dart';

class ExamPaperController extends GetxController {
  RxList<ExamPaper> examPapers = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllExamPapers();
    super.onInit();
  }
  
  getAllExamPapers() async {
    loading.value = true;
    await ExamPaperRepo.getExamPaper(
      onSuccess: (examPaper) {
        loading.value = false;
        examPapers.addAll(examPaper);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
