import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:first_app/Services/auth_services.dart';
import 'package:first_app/navigator.dart';
import 'package:first_app/Screens/login.dart';

import '../Services/globals.dart';

class AuthController extends GetxController {
  // final AuthService authService = AuthService();

  var loading = false.obs;

  Future<void> login({required String email, required String password}) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      http.Response response = await AuthServices.login(email, password);
      Map responseMap = await jsonDecode(response.body);
      if (response.statusCode == 200) {
            Get.to(() => const NavigationPage());
            Get.snackbar("Success", responseMap["message"]);
            
      } else {
        Get.snackbar("Failed", responseMap["message"]);
      }
    } else {
      Get.snackbar("Failed", "Enter all the required fields");
    }
  }

  Future<void> register({required String firstName, required String lastName, required String email, required String phoneNumber, required String password, required String confirmPassword}) async {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);        
    if (!emailValid) {
      setEmail(email);
      if(password == confirmPassword){
        String name = "$firstName $lastName";
        final http.Response response = await AuthServices.register(name, email, phoneNumber, password);
        Map<String, dynamic> responseMap = jsonDecode(response.body);
        if (response.statusCode == 200) {
          Get.to(const NavigationPage());
          Get.snackbar("Success", "User register successfully");
        } else {
          Get.snackbar("Failed", responseMap.values.first[0]);
        }
      } else{
        Get.snackbar("Failed", 'Enter same password to confirm');
      }
    } else {
      Get.snackbar("Failed", 'Email not valid');
    }
  }

  Future<void> logout() async {
    http.Response response = await AuthServices.logout();
    // Map responseMap = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Get.to(()=>const LoginScreen());
      Get.snackbar("Success", "User Logout Successfully");     
    } 
    else {
      Get.snackbar("Failed", "Error Try again!");
    }
  }


    Future<void> changePassword({required String currentPassword, required String newPassword, required String confirmNewPassword}) async {
    if (currentPassword.isNotEmpty && newPassword.isNotEmpty && confirmNewPassword.isNotEmpty) {
      if(newPassword == confirmNewPassword){
        if(newPassword != currentPassword){
          http.Response response = await AuthServices.changePassword(currentPassword, newPassword);
          Map responseMap = jsonDecode(response.body);
          if (response.statusCode == 200) {
            Get.to(const NavigationPage());
            Get.snackbar("Success", responseMap["message"]); 
          }else{
            Get.snackbar("Failed", responseMap["message"]); 
          }
        }else{
          Get.snackbar("Failed", 'Current password and new password cannot be same');
        }
      } else {
        Get.snackbar("Failed", 'Please enter same password in confirm password');
      }
    } else {
      Get.snackbar("Failed", 'Enter all the required fields');
    }
  }

    Future<void> forgotPassword({required String email}) async {
    if(email.isNotEmpty){
      
      http.Response response = await AuthServices.resetPassword(email);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.to(()=>const NavigationPage());
        Get.snackbar('Success', 'Password Changed');
            
      } else {
        Get.snackbar('Failed', responseMap["message"]);
      }
    } else {
      Get.snackbar('Failed', 'Enter your email address');
    }

    }
}
