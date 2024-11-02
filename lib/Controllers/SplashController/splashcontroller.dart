import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Screens/Login/login.dart';

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
    Get.offAll(() => LoginScreen(), transition: Transition.circularReveal);
  }

  //----------------------------------
}
