import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nahlaonline/Screens/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLanguageLoads = false.obs;
  List<String> languageNames = ["English", "Arabic"];
  final List<String> languageCodes = ['en', 'ar'];
  var selectedLanguageIndex = 0.obs;
  bool isFirstTap = true;

  Future<void> changeLanguage(int index) async {
    selectedLanguageIndex.value = index;
    String selectedLanguageCode = languageCodes[index];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguageCode', selectedLanguageCode);
    Get.updateLocale(Locale(selectedLanguageCode));
    navigationS();
    update();
  }

  navigationS() async {
    isLanguageLoads.value = true;
    Get.offAll(() => LoginScreen(), transition: Transition.circularReveal);
    isLanguageLoads.value = false;
  }
}
