import 'package:first_app/Screens/navigator.dart';
import 'package:first_app/Screens/splashscreen.dart';
import 'package:first_app/Services/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  runApp(
    KhaltiScope(
      publicKey: "test_public_key_f18b878e02d64e10988f46aea7baa233",
        builder: (context, navigatorKey) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
                  // supportedLocales: const [
                  //   Locale('en', 'US'),
                  //   Locale('ne', 'NP'),
                  // ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          translations: LocaleString(),
          locale: const Locale('en','US'),
          home: const SplashScreen()
        );
      }
    )
  );
}


