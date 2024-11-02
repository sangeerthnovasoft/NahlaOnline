import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nahlaonline/Util/toastsnack.dart';

class ForgotPasswordCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  GlobalKey<FormState> formKeys = GlobalKey<FormState>();
  final TextEditingController forgotPassWController = TextEditingController();
  RxBool isForgotPassLoads = false.obs;
//-----------------------------------------------
  void navigation({typedVAl}) async {
    isForgotPassLoads.value = true;
    if (forgotPassWController.text.isEmpty) {
      snackBarError("Please enter your Phone Number...");
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        forgotPassWController.clear();

        // Get.back();
      });
    }
    isForgotPassLoads.value = false;
    update();
  }
//-----------------------------------------------
}
