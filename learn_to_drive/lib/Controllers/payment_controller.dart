import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/Services/globals.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  var token = "".obs;
  var amount = 0.obs;

  void postPayment() async {
    try {
      var response = await http.post(
        Uri.parse(paymentAPI),
        body: {
          'user_id': currentUser.id,
          "token": token.value,
          "amount": amount.value.toString(),
        },
      );
      print(token.value);
      print(response.body);
    } catch (e) {
      Future.error(e);
    }
  }
}