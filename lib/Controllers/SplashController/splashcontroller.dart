import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Screens/HomeScreen/homescreen.dart';
import 'package:nahlaonline/Screens/Language%20Screen/languagescreen.dart';
import 'package:nahlaonline/Util/Firebase/firebase_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  String? keyToken;

  @override
  void onInit() {
    FireBaseAPI().initNotifications();
    navigation();
    super.onInit();
  }

  //-----------------------------------

  navigation() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refreshToken');
    String? savedLanguageCode = prefs.getString('selectedLanguageCode');
    if (savedLanguageCode != null && savedLanguageCode.isNotEmpty) {
      Get.updateLocale(Locale(savedLanguageCode));
    }
    await Future.delayed(const Duration(seconds: 2));
    if (refreshToken == null || refreshToken.isEmpty || refreshToken == "") {
      Get.offAll(() => LanguageScreen(), transition: Transition.circularReveal);
    } else {
      Get.offAll(() => HomeScreen(refreshToken: refreshToken.toString()),
          transition: Transition.circularReveal);
    }
  }

  //----------------------------------
}
