import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:first_app/Controllers/payment_controller.dart';

class SettingsController extends GetxController{
  
  PaymentController paymentController = Get.put(PaymentController());
  bool isEnglish = true;
  final picker = ImagePicker();
  Rxn<File> image = Rxn<File>();
  var isDarkModeOn = true.obs;

  void toggleDarkMode(bool value) {
    isDarkModeOn.value = value;
    Get.changeThemeMode(isDarkModeOn.value ? ThemeMode.dark : ThemeMode.light);
  }

  checkLanguage(String english, String nepali){
    if(isEnglish){
      return english;
    }
    else{
      return nepali;
    }
  }

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
  
  payWithKhalti(context) {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 20000,
        productIdentity: "jhasdklas",
        productName: "dsdjksldasd",
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: (success) {
        paymentController.token.value = success.token;
        paymentController.amount.value = success.amount;
        paymentController.postPayment();
        Get.snackbar("Payment Success", 'The Payment is successfully completed.');
      },
      onFailure: (fa) {
        Get.snackbar("Payment Fail ", 'Your Payment has failed. Please Try again!');
      },
      onCancel: () {
       
        Get.snackbar("Payment Cancelled ", 'You have cancelled your payment.');
      },
    );
  }
}