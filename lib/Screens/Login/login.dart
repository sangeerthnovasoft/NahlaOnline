import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/LoginController/logincontroller.dart';
import 'package:nahlaonline/Screens/RegisterScreen/register.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ForgotPasswordScreen/forgotpassword.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final loginCntrl = Get.put(LoginScreenCntrl());
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return GetBuilder<LoginScreenCntrl>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Powered By'.tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                    color: Colors.black54,
                    fontSize: 8,
                    fontWeight: FontWeight.w400),
              ),
              InkWell(
                onTap: () {
                  final Uri url = Uri.parse('https://www.novasoftech.com');
                  launchUrl(url);
                },
                child: Text(
                  'Novasoft Technologies'.tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xffc49a6d),
                      color: const Color(0xffc49a6d),
                      fontWeight: FontWeight.w600,
                      fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                keyboardIsOpened
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image.asset('assets/images/dashlogo.png',
                            height: 18),
                      ),
                const SizedBox(height: 40),
                Text(
                  "Hey, Welcome Back !",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.grey.shade900,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      "Phone Number",
                      style: GoogleFonts.raleway(
                        color: Colors.grey.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: loginCntrl.phNoController,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.sentences,
                  style: GoogleFonts.inter(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    }
                    return "Phone No. can't be empty";
                  },
                  onChanged: (text) {},
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Please enter your Phone No.",
                    hintStyle: GoogleFonts.raleway(
                        color: Colors.black54,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                    prefixIcon: const Icon(
                      CupertinoIcons.phone,
                      color: Colors.black54,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffC9E0FF),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffc49a6d),
                        ),
                        borderRadius: BorderRadius.circular(8.0)),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffC9E0FF),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Password",
                      style: GoogleFonts.raleway(
                        color: Colors.grey.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: loginCntrl.passwordController,
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: loginCntrl.isObscured.value,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  style: GoogleFonts.inter(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    }
                    return "Password can't be empty";
                  },
                  onChanged: (text) {},
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        loginCntrl.toggleObscure();
                      },
                      child: Icon(
                        loginCntrl.isObscured.value
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash_fill,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                    hintText: "Please enter your Password",
                    hintStyle: GoogleFonts.raleway(
                        color: Colors.black54,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                    prefixIcon: const Icon(
                      CupertinoIcons.lock_open,
                      color: Colors.black54,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffC9E0FF),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffc49a6d),
                        ),
                        borderRadius: BorderRadius.circular(8.0)),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffC9E0FF),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => ForgotPassword(),
                            transition: Transition.downToUp);
                      },
                      child: Text("Forgot password ?",
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: loginCntrl.isLoginLoadss.value
                      ? null
                      : () {
                          // loginCntrl.getLogin(
                          //     userNames: loginCntrl.userNamesController.text,
                          //     passWord: loginCntrl.passwordController.text);
                        },
                  child: Obx(
                    () => loginCntrl.isLoginLoadss.value
                        ? const LinearProgressIndicator(
                            color: Color(0xffc49a6d),
                          )
                        : Container(
                            width: double.maxFinite,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffd69a54)),
                            child: Material(
                                type: MaterialType.transparency,
                                child: Text("Log In",
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1))),
                          ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.raleway(
                          color: Colors.grey.shade900,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => RegisterScreen(),
                            transition: Transition.downToUp);
                      },
                      child: Text(
                        "Register",
                        style: GoogleFonts.raleway(
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xffc49a6d),
                            color: const Color(0xffc49a6d),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
