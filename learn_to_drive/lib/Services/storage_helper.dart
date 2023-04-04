import 'dart:convert';
import 'dart:developer';
import 'package:first_app/Models/access_token_model.dart';
import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/Services/storage_keys.dart';
import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static DateTime? getAppLoadedDate() {
    try {
      final box = GetStorage();
      var fetchedDate = box.read(StorageKey.APP_LOAD_DATE);
      if (fetchedDate != null) {
        DateTime dateTime = DateTime.parse(fetchedDate);
        return dateTime;
      } else {
        return null;
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }

  static UserAccessToken? getToken() {
    try {
      final box = GetStorage();
      UserAccessToken token = UserAccessToken.fromJson(
          jsonDecode(box.read(StorageKey.ACCESS_TOKEN)) ?? "");
      log("--------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>${StorageKey.ACCESS_TOKEN}");
      return token;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static CurrentUser? getUser() {
    try {
      final box = GetStorage();
      CurrentUser user = CurrentUser.fromJson(box.read(StorageKey.USER));

      log("--------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>${CurrentUser.fromJson(box.read(StorageKey.USER))}");
      return user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
