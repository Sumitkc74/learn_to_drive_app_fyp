import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:first_app/Models/access_token_model.dart';
import 'package:first_app/Models/current_user_model.dart';

import 'package:first_app/Services/repo/auth_services_repo.dart';
import 'package:first_app/Screens/navigator.dart';
import 'package:first_app/Screens/AuthScreen/login.dart';

class AuthController extends GetxController {
  // final AuthService authService = AuthService();

  var loading = false.obs;

  Future<void> login({required String email, required String password}) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      http.Response response = await AuthServices.login(email, password);
      Map responseMap = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        currentUser = CurrentUser.fromJson(responseMap['user']);
        userAccessToken = UserAccessToken.fromJson(responseMap['token']);
        Get.off(() => const NavigationPage());
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
    if (emailValid) {
      if(password == confirmPassword){
        String name = "$firstName $lastName";
        final http.Response response = await AuthServices.register(name, email, phoneNumber, password);
        Map<String, dynamic> responseMap = jsonDecode(response.body);
        if (response.statusCode == 200) {
          Get.to(const NavigationPage());
          Get.snackbar("Registration Successful", "User has been registered successfully");
        } else {
          Get.snackbar("Failed", responseMap['message']);
        }
      } else{
        Get.snackbar("Failed", 'Enter same password to confirm');
      }
    } else {
      Get.snackbar("Invalid Email", 'Enter a valid email address');
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
            Get.back();
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
