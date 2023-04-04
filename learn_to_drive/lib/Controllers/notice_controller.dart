
import 'dart:developer';
import 'package:first_app/Models/notice_model.dart';
import 'package:first_app/Services/repo/notice_repo.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController {
  RxList<Notice> notices = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllNotices();
    super.onInit();
  }

  getAllNotices() async {
    loading.value = true;
    await NoticeRepo.getNotice(
      onSuccess: (notice) {
        loading.value = false;

        notices.addAll(notice);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
