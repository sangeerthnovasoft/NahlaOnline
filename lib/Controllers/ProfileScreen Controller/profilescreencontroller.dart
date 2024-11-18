import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Controllers/LanguageScreenController/languagecontroller.dart';
import 'package:nahlaonline/Screens/Login/login.dart';

class ProfileScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  final languageCntrl = Get.put(LanguageScreenCntrl());
  //-----------------------------------

  String? dropdownvalue;
  var dropItems = [
    "English",
    "Arabic",
  ];
  changeLangu(newValue) async {
    dropdownvalue = newValue;
    languageCntrl.changeLanguage(newValue);
    update();
  }

//-------------------------------------------
  Future<void> showDgLogOUT() async {
    await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: AlertDialog(
            surfaceTintColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey
                : Colors.white,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.white,
            shadowColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : const Color(0xff000029),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 35,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Color(0xffBCBCBC),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("No",
                              style: GoogleFonts.rubik(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffF5F5F8))),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      logOut();
                    },
                    child: Container(
                      width: 100,
                      height: 35,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("Logout",
                              style: GoogleFonts.rubik(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  const Icon(Icons.power_settings_new_rounded,
                      size: 50, color: Colors.red),
                  const SizedBox(height: 8),
                  Text("Are you sure to Logout ?",
                      style: GoogleFonts.raleway(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

//---------
  logOut() async {
    // final prefs = await SharedPreferences.getInstance();
    // final db = await DBConnection.getInstance();
    // await db?.rawQuery("DELETE FROM UserPrivilages");
    // await db
    //     ?.rawQuery("DELETE FROM SQLITE_SEQUENCE WHERE name='UserPrivilages'");
    // await prefs.remove('UserName');
    // await prefs.remove('Password');
    // await prefs.remove('LocationID');
    // await prefs.remove('UserID');
    // await prefs.remove("dateTimeToday");
    Get.offAll(() => LoginScreen());
    update();
  }
  //-----------------------------------
}
