import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Controllers/RegisterController/registercontroller.dart';
import 'package:nahlaonline/Screens/HomeScreen/homescreen.dart';
import 'package:nahlaonline/Util/toastsnack.dart';
import 'package:pinput/pinput.dart';

class OTPscreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController otpControllers = TextEditingController();
  final FocusNode focusNodeOTP = FocusNode();
  RxBool isOTPscreenLoads = false.obs;
  final RxBool isObscured = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

//----------------------------------------------OTP
  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle:
        const TextStyle(fontSize: 22, color: Color.fromRGBO(30, 60, 87, 1)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.brown)),
  );

  //-------------------------------------------------navToVerify
  Future<void> navToVerify({userID}) async {
    if (otpControllers.text.isEmpty) {
      snackBarError('Required field is empty');
      return;
    }
    isOTPscreenLoads.value = true;
    // final prefs = await SharedPreferences.getInstance();
    // final selectedLanguageCode = prefs.getString('selectedLanguageCode') ?? '1';
    // final langId = (selectedLanguageCode == 'en') ? '1' : '2';
    final url = Uri.parse('$apiURL/User/VerifyOTP');
    final headers = {'Content-Type': 'application/json'};
    final body = {"ID": userID.toString(), "OTP": otpControllers.text};
    log(body.toString());
    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final error = jsonResponse['error'];
        final String responseMsg = jsonResponse['message'];
        if (error == false) {
          final String refreshToken = jsonResponse['data']['refreshToken'];
          print("refreshToken : $refreshToken");
          await Future.delayed(const Duration(seconds: 1));
          Get.offAll(() => HomeScreen());
        } else {
          toastMessage(responseMsg);
        }
      } else {
        toastMessage("Failed. Please try again.");
      }
    } catch (e) {
      toastMessage("An error occurred. Please try again.");
    } finally {
      isOTPscreenLoads.value = false;
      update();
    }
  }

  //---------------------------------------------------
}
