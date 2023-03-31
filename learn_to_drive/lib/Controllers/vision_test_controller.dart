import 'dart:developer';
import 'package:first_app/Services/repo/vision_test_repo.dart';
import 'package:first_app/Models/vision_test.dart';
import 'package:get/get.dart';

class VisionTestController extends GetxController {
  RxList<VisionTest> visionTests = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllVisionTests();
    super.onInit();
  }

  getAllVisionTests() async {
    loading.value = true;
    await VisionTestRepo.getVisionTest(
      onSuccess: (visionTest) {
        loading.value = false;

        visionTests.addAll(visionTest);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
