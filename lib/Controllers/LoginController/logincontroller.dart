import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Controllers/RegisterController/registercontroller.dart';
import 'package:nahlaonline/Screens/OTP%20Screen/otpscreen.dart';
import 'package:nahlaonline/Util/toastsnack.dart';

class LoginScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController phNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RxBool isLoginLoadss = false.obs;
  final RxBool isObscured = true.obs;
  dynamic ipAdd = [];

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
    await getIpAddress();
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
    final url = Uri.parse('$apiURL/User/UserLogin');
    final headers = {'Content-Type': 'application/json'};
    final body = {
      "Username": phoNOLog,
      "Password": passWord,
      "IPAddress": ipAdd.toString(),
      "DeviceMACID": "AD98Q945DWD9W54DW58D4W54DW5D4W5DW95",
      "DeviceFCM": "545454-651POJPO"
    };
    log(body.toString());

    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final error = jsonResponse['error'];
        final String responseMsg = jsonResponse['message'];
        if (!error) {
          await Future.delayed(const Duration(seconds: 2));
          Get.offAll(() => OTPScreen());
        } else {
          toastMessage(responseMsg);
        }
      } else {
        toastMessage("Login failed. Please try again.");
      }
    } catch (e) {
      toastMessage("An error occurred during login. Please try again.");
    } finally {
      isLoginLoadss.value = false;
      update();
    }
  }

//--------------------------------
  getIpAddress() async {
    var ipAddress = IpAddress(type: RequestType.json);
    dynamic data = await ipAddress.getIpAddress();
    print("data IP : $data");
  }
//----------------------------------
}
