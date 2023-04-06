import 'dart:developer';
import 'dart:io';

import 'package:first_app/Controllers/payment_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class SettingsController extends GetxController{
  
  PaymentController paymentController = Get.put(PaymentController());

  bool isEnglish = true;

  checkLanguage(String english, String nepali){
    if(isEnglish){
      return english;
    }
    else{
      return nepali;
    }
  }

  final picker = ImagePicker();
  Rxn<File> image = Rxn<File>();
  void pickImage() async {
    log("Picking image");
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
      maxHeight: 500,
      maxWidth: 500
    );
    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }
  
  String? token;
  int? amount;
  payWithKhalti(
      context) {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 2000,
        productIdentity: "jhasdklas",
        productName: "dsdjksldasd",
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: (success) {
        // paymentController.token.value = success.token;
        token = success.token.toString();
        amount = success.amount;
        paymentController.postPayment();

        Get.snackbar("Success ", 'Payment success');
        },
      onFailure: (fa) {
        
        Get.snackbar("fail ", 'Payment fail');
      },
      onCancel: () {
       
        Get.snackbar("cancel ", 'Payment cancel');
      },
    );
  }

}