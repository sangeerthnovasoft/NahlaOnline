import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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

  // Future<void> getRegister({
  //   String? firstN,
  //   String? lastN,
  //   String? emails,
  //   String? passW,
  // }) async {
  //   if (firstNameController.text.isEmpty &&
  //       lastNameController.text.isEmpty &&
  //       emailsController.text.isEmpty &&
  //       passWController.text.isEmpty) {
  //     snackBarError("Please fill the required fields...");
  //     return;
  //   } else if (firstNameController.text.isEmpty) {
  //     snackBarError("Please enter your first name...");
  //     return;
  //   } else if (lastNameController.text.isEmpty) {
  //     snackBarError("Please enter your last name...");
  //     return;
  //   } else if (emailsController.text.isEmpty) {
  //     snackBarError("Please enter your email...");
  //     return;
  //   } else if (passWController.text.isEmpty) {
  //     snackBarError("Please enter your Password...");
  //     return;
  //   }

  //   isCreateAccLoadss.value = true;
  //   final url = Uri.parse('http://172.16.1.83:81/api/register');
  //   final headers = {'Content-Type': 'application/json'};
  //   final body = jsonEncode({
  //     "FirstName": firstN,
  //     "LastName": lastN,
  //     "Email": emails,
  //     "Password": passW
  //   });
  //   log(body.toString());

  //   try {
  //     final response = await http.post(url, headers: headers, body: body);
  //     if (response.statusCode == 200) {
  //       final jsonResponse = jsonDecode(response.body);
  //       final error = jsonResponse['error'];
  //       final String responseMsg = jsonResponse['message'];

  //       if (!error) {
  //         await Future.delayed(const Duration(seconds: 2));
  //         snackBarSuccess(responseMsg.toString());
  //         Get.back();
  //       } else {
  //         snackBarError(responseMsg);
  //       }
  //     } else {
  //       snackBarError("Not Created. Please try again.");
  //     }
  //   } catch (e) {
  //     snackBarError("An error occurred. Please try again.");
  //     print(e);
  //   } finally {
  //     isCreateAccLoadss.value = false;
  //     update();
  //   }
  // }
}
