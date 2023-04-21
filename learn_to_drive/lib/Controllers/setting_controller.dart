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
  
  payWithKhalti(context) {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 20000,
        productIdentity: "PaymentId",
        productName: "UserUpgrade",
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: (success) {
        paymentController.token.value = success.token;
        paymentController.amount.value = success.amount;
        paymentController.postPayment();
        Get.snackbar("Payment Success", 'The Payment is successfully completed.', backgroundColor: Colors.green);
      },
      onFailure: (fa) {
        Get.snackbar("Payment Failed", 'Your Payment has failed. Please Try again!', backgroundColor: Colors.red);
      },
      onCancel: () {
       
        Get.snackbar("Payment Cancelled", 'You have cancelled your payment.', backgroundColor: Colors.red);
      },
    );
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
}