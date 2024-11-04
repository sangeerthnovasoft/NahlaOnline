import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Util/toastsnack.dart';

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
  Future<void> getLogin({String? phoNOLog, String? passWord}) async {
    if (phNoController.text.isEmpty && passwordController.text.isEmpty) {
      snackBarError("Please fill the required fields...");
      return;
    } else if (phNoController.text.isEmpty) {
      snackBarError("Please enter your Phone No...");
      return;
    } else if (passwordController.text.isEmpty) {
      snackBarError("Please enter your password...");
      return;
    }

    isLoginLoadss.value = true;
    // final url = Uri.parse('http://172.16.1.83:81/api/login');
    // final headers = {'Content-Type': 'application/json'};
    // final body = {
    //   "userName": phoNOLog,
    //   "password": passWord,
    // };
    // log(body.toString());

    // try {
    //   final response =
    //       await http.post(url, headers: headers, body: jsonEncode(body));
    //   if (response.statusCode == 200) {
    //     final jsonResponse = jsonDecode(response.body);
    //     final error = jsonResponse['error'];
    //     final String responseMsg = jsonResponse['message'];

    //     if (!error) {
    //       await Future.delayed(const Duration(seconds: 2));
    //      // Get.offAll(() => HomeScreen(), transition: Transition.leftToRight);
    //     } else {
    //       snackBarError(responseMsg);
    //     }
    //   } else {
    //     snackBarError("Login failed. Please try again.");
    //   }
    // } catch (e) {
    //   snackBarError("An error occurred during login. Please try again.");
    // } finally {
    //   isLoginLoadss.value = false;
    //   update();
    // }
  }

//----------------------------------
}
