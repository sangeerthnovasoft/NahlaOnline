import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/OTPScreenController/otpcontroller.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  String? userID;
  String? phoneNOo;
  OTPScreen({super.key, this.userID, this.phoneNOo});
  final oTPCntrl = Get.put(OTPscreenCntrl());

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? null
            : Colors.white,
        appBar: AppBar(
          elevation: 0,
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
        body: GetBuilder<OTPscreenCntrl>(builder: (_) {
          return ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Text(
                      "OTP Verification".tr,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.grey.shade900,
                      ),
                    )),
                Center(
                    child: Column(children: [
                  keyboardIsOpened
                      ? const SizedBox(height: 30)
                      : const SizedBox(height: 25),
                  keyboardIsOpened
                      ? Image.asset("assets/images/otp.png",
                          fit: BoxFit.contain, width: 100, height: 100)
                      : Image.asset("assets/images/otp.png",
                          fit: BoxFit.contain, width: 150, height: 200),
                  const SizedBox(height: 25),
                  Text("Enter the OTP sent to".tr,
                      style: GoogleFonts.exo2(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  Text(phoneNOo.toString(),
                      style: GoogleFonts.exo2(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 25),
                  Pinput(
                      length: 6,
                      controller: oTPCntrl.otpControllers,
                      focusNode: oTPCntrl.focusNodeOTP,
                      showCursor: true,
                      //   androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                      //   listenForMultipleSmsOnAndroid: false,
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      autofocus: true,
                      autofillHints: const [AutofillHints.oneTimeCode],
                      closeKeyboardWhenCompleted: true,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      separatorBuilder: (index) => const SizedBox(width: 4),
                      validator: (value) {
                        return value == oTPCntrl.otpControllers.text
                            ? null
                            : 'Pin is incorrect';
                      },
                      onCompleted: (pin) {},
                      onChanged: (value) {},
                      cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: Colors.blue)
                          ]),
                      focusedPinTheme: oTPCntrl.defaultPinTheme.copyWith(
                          decoration: oTPCntrl.defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(23, 171, 144, 1)))),
                      submittedPinTheme: oTPCntrl.defaultPinTheme.copyWith(
                          decoration: oTPCntrl.defaultPinTheme.decoration!.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : const Color.fromRGBO(243, 246, 249, 0),
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(23, 171, 144, 1)))),
                      errorPinTheme: oTPCntrl.defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent))),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: oTPCntrl.isOTPscreenLoads.value
                        ? null
                        : () async {
                            if (!oTPCntrl.isOTPscreenLoads.value) {
                              await oTPCntrl.navToVerify(
                                  userID: userID.toString());
                            }
                          },
                    child: Obx(
                      () => oTPCntrl.isOTPscreenLoads.value
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: const LinearProgressIndicator(
                                  color: Color(0xffc49a6d)),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, right: 18),
                              child: Container(
                                  width: double.maxFinite,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xffd69a54)),
                                  child: Material(
                                      type: MaterialType.transparency,
                                      child: Text("Verify".tr,
                                          style: GoogleFonts.raleway(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1)))),
                            ),
                    ),
                  )
                ]))
              ]);
        }),
      ),
    );
  }
}
