import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController phNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RxBool isLoginLoadss = false.obs;
  final RxBool isObscured = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  //-------- Password eye
  void toggleObscure() {
    isObscured.value = !isObscured.value;
    update();
  }
//---------------------

  //----------------------------------
}
