import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Screens/Language%20Screen/languagescreen.dart';

class SplashScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  String? keyToken;

  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  //-----------------------------------

  navigation() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => LanguageScreen(), transition: Transition.circularReveal);
  }

  //----------------------------------
}
