import 'dart:developer';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:first_app/Models/notice_model.dart';
import 'package:first_app/Services/repo/notice_repo.dart';

class NoticeController extends GetxController {
  RxList<Notice> notices = RxList();
  RxInt unReadCount = RxInt(0);
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
        unReadCount.value += notice.length;
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
