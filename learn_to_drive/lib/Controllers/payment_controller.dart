import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/Services/globals.dart';

class PaymentController extends GetxController {
  var token = "".obs;
  var amount = 0.obs;

  void postPayment() async {
    try {
      // log("tnx id -----------${token.toString()}");
      // log("tnx id -----------${amount.toString()}");
      // log("tnx id -----------${currentUser.id.toString()}");

      var response = await http.post(
        Uri.parse(paymentAPI),
        headers: headers,
        body: {
          "user_id" : currentUser.id.toString(),
          "token": token.value,
          "amount": (amount.value/100).toString(),
        },
      );
      // print(response);
      
      Map responseMap = await jsonDecode(response.body);
      // print(responseMap);
      if (response.statusCode == 200) {
        // currentUser = CurrentUser.fromJson(responseMap['data']['user']);
        currentUser.role = 'PremiumUser';
        log(responseMap.toString());
        log(currentUser.role.toString());
      } else {
        throw Exception("Failed to post payment");
      }
    } catch (e) {
      log(e.toString());
      throw Exception("Error occurred while posting payment: ${e.toString()}");
    }
  }
}