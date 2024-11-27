import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  String? ipAddress;

  @override
  void onInit() {
    getIpAddress();
    super.onInit();
  }

  //-------- Password eye
  void toggleObscure() {
    isObscured.value = !isObscured.value;
    update();
  }

//---------------------getLogin
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
    await getIpAddress();
    String platformValue = Platform.isAndroid ? "A" : "I";
    final fcmToken = await FirebaseMessaging.instance.getToken();
    final url = Uri.parse('$apiURL/User/UserLogin');
    final headers = {'Content-Type': 'application/json'};
    final body = {
      "Username": phoNOLog,
      "Password": passWord,
      "IPAddress": ipAddress.toString(),
      "DeviceType": platformValue.toString(),
      "DeviceFCM": fcmToken.toString()
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
          final int userID = jsonResponse['data']['userID'];
          await Future.delayed(const Duration(seconds: 1));
          Get.offAll(() => OTPScreen(
              userID: userID.toString(), phoneNOo: phoNOLog.toString()));
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

//--------------------------------getIpAddress without package

  Future<void> getIpAddress() async {
    try {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4) {
            // print("IP Address: ${addr.address}");
            ipAddress = addr.address;
            return; // Use this address as required
          }
        }
      }
    } catch (e) {
      log("Error fetching IP address: $e");
    }
  }
//----------------------------------
}
