import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Util/toastsnack.dart';

class RegisterScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController compNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController vatNoController = TextEditingController();
  final TextEditingController crNOController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailsController = TextEditingController();
  final TextEditingController passWController = TextEditingController();
  final TextEditingController confPassWController = TextEditingController();
  final RxBool isObscured = true.obs;
  final RxBool isObscuredCon = true.obs;
  final RxBool isCreateAccLoadss = false.obs;

  //-----------------------------------
  void toggleObscure() {
    isObscured.value = !isObscured.value;
    update();
  }

  void toggleObscureConf() {
    isObscuredCon.value = !isObscuredCon.value;
    update();
  }
  //----------------------------------

  //-----------------------------------

  Future<void> getRegister({
    String? nameC,
    String? compName,
    String? addComp,
    String? vatNos,
    String? cRno,
    String? phonNO,
    String? emails,
    String? passW,
    String? confPassW,
  }) async {
    if (nameController.text.isEmpty &&
        compNameController.text.isEmpty &&
        addressController.text.isEmpty &&
        vatNoController.text.isEmpty &&
        crNOController.text.isEmpty &&
        phoneNoController.text.isEmpty &&
        emailsController.text.isEmpty &&
        passWController.text.isEmpty &&
        confPassWController.text.isEmpty) {
      snackBarError("Please fill the required fields...");
      return;
    } else if (nameController.text.isEmpty) {
      snackBarError("Please enter your name...");
      return;
    } else if (compNameController.text.isEmpty) {
      snackBarError("Please enter your Company name...");
      return;
    } else if (addressController.text.isEmpty) {
      snackBarError("Please enter your address...");
      return;
    } else if (vatNoController.text.isEmpty) {
      snackBarError("Please enter your VAT No...");
      return;
    } else if (crNOController.text.isEmpty) {
      snackBarError("Please enter your CR No...");
      return;
    } else if (phoneNoController.text.isEmpty) {
      snackBarError("Please enter your Phone No...");
      return;
    } else if (emailsController.text.isEmpty) {
      snackBarError("Please enter your email...");
      return;
    } else if (passWController.text.isEmpty) {
      snackBarError("Please enter your Password...");
      return;
    } else if (confPassWController.text.isEmpty) {
      snackBarError("Please enter Password again to confirm...");
      return;
    }

    isCreateAccLoadss.value = true;
    final url = Uri.parse('http://172.16.1.200:90/registration');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "UserName": nameC.toString(),
      "CompanyName": compName.toString(),
      "Address": addComp.toString(),
      "VATNumber": vatNos.toString(),
      "CRNumber": cRno.toString(),
      "PhoneNumber": phonNO.toString(),
      "MailID": emails.toString(),
      "Password": passW.toString()
    });

    log(body.toString());

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final error = jsonResponse['error'];
        final String responseMsg = jsonResponse['message'];

        if (!error) {
          await Future.delayed(const Duration(seconds: 1));
          snackBarSuccess(responseMsg.toString());
          Get.back();
        } else {
          snackBarError(responseMsg);
        }
      } else {
        snackBarError("Not Created. Please try again.");
      }
    } catch (e) {
      snackBarError("An error occurred. Please try again.");
      print(e);
    } finally {
      isCreateAccLoadss.value = false;
      update();
    }
  }
}
