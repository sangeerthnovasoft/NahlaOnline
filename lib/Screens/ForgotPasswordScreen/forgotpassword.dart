import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/ForgotPassController/forgotpasscontroller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final GlobalKey<FormState> formKeys = GlobalKey<FormState>();
  final forgotPassWordCntrl = Get.put(ForgotPasswordCntrl());
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpens = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return GetBuilder<ForgotPasswordCntrl>(builder: (_) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? null
              : Colors.white,
          appBar: AppBar(
            elevation: 0,
            surfaceTintColor: Theme.of(context).brightness == Brightness.dark
                ? null
                : Colors.white,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? null
                : Colors.white,
            automaticallyImplyLeading: false,
            leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    highlightColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.transparent
                            : Colors.white,
                    hoverColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.transparent
                        : Colors.white,
                    focusColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.transparent
                        : Colors.white,
                    splashColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.transparent
                        : Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffECECEC)),
                            shape: BoxShape.circle),
                        child: const Icon(Icons.arrow_back_ios_new)))),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView(
              children: [
                Form(
                  key: formKeys,
                  child: Column(
                    children: [
                      keyboardIsOpens
                          ? Image.asset(
                              "assets/images/forgotpass.png",
                              fit: BoxFit.contain,
                              width: 160,
                            )
                          : Image.asset(
                              "assets/images/forgotpass.png",
                              width: 260,
                              fit: BoxFit.contain,
                            ),
                      const SizedBox(height: 6),
                      Text(
                        "Forgot Password".tr,
                        style: TextStyle(
                          fontSize: keyboardIsOpens ? 16 : 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.grey.shade900,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          Text(
                            "Phone Number".tr,
                            style: GoogleFonts.raleway(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white70
                                  : Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: forgotPassWordCntrl.forgotPassWController,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        enableSuggestions: false,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.sentences,
                        style: GoogleFonts.inter(
                            decoration: TextDecoration.none,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
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
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: "Please enter your Phone No.".tr,
                          hintStyle: GoogleFonts.raleway(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white70
                                  : Colors.black54,
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                          prefixIcon: Icon(
                            CupertinoIcons.phone,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white70
                                    : Colors.black54,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
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
                      // TextFormField(
                      //   controller: forgotPassWordCntrl.forgotPassWController,
                      //   textInputAction: TextInputAction.done,
                      //   keyboardType: TextInputType.number,
                      //   textCapitalization: TextCapitalization.none,
                      //   decoration: InputDecoration(
                      //       hintText: "Please enter your Phone Number",
                      //       hintStyle: GoogleFonts.raleway(
                      //           color: Colors.black54,
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w400)),
                      //   style: GoogleFonts.rubik(
                      //       color: Colors.black, fontWeight: FontWeight.w400),
                      //   validator: (value) {
                      //     if (value != null && value.isNotEmpty) {
                      //       if (value.length != 10) {
                      //         return "Phone number must be 10 digits";
                      //       }
                      //       return null;
                      //     }
                      //     return "Field can't be empty";
                      //   },
                      //   onChanged: (text) {
                      //     // Remove the "05" if it's already present, to handle modifications correctly
                      //     if (text.startsWith("05")) {
                      //       text = text.substring(2);
                      //     }
                      //     // Only allow 8 more digits
                      //     if (text.length > 8) {
                      //       text = text.substring(0, 8);
                      //     }
                      //     // Set the formatted text back to the controller
                      //     forgotPassWordCntrl.forgotPassWController.value =
                      //         TextEditingValue(
                      //       text: "05$text",
                      //       selection: TextSelection.fromPosition(
                      //         TextPosition(offset: "05$text".length),
                      //       ),
                      //     );
                      //   },
                      // ),
                      const SizedBox(height: 40),
                      InkWell(
                        highlightColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.transparent
                                : Colors.white,
                        hoverColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.transparent
                                : Colors.white,
                        focusColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.transparent
                                : Colors.white,
                        splashColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.transparent
                                : Colors.white,
                        onTap: forgotPassWordCntrl.isForgotPassLoads.value
                            ? null
                            : () {
                                forgotPassWordCntrl.navigation(
                                    typedVAl: forgotPassWordCntrl
                                        .forgotPassWController.text);
                              },
                        child: Obx(
                          () => forgotPassWordCntrl.isForgotPassLoads.value
                              ? const LinearProgressIndicator(
                                  color: Colors.black,
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
                                      child: Text("Get OTP".tr,
                                          style: GoogleFonts.raleway(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1))),
                                ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
