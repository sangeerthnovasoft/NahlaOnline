import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/ProfileScreen%20Controller/profilescreencontroller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final profCntrl = Get.put(ProfileScreenCntrl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenCntrl>(builder: (_) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset("assets/images/pro.png",
                          height: 80, width: 80, fit: BoxFit.contain)),
                  const SizedBox(height: 8),
                  Text(
                    "Name".tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey.shade900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Address".tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey.shade900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ListTile(
                dense: true,
                enabled: true,
                enableFeedback: true,
                leading: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffF2F5FC), shape: BoxShape.circle),
                    child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.translate_sharp,
                            size: 20, color: Color(0xff081d35)))),
                title: Text(
                  'Change language'.tr,
                  style: GoogleFonts.raleway(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey.shade900,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? null
                          : Colors.white,
                      border: Border.all(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : const Color(0xff010041).withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(8.0)),
                  width: 130,
                  height: 35,
                  child: DropdownButtonHideUnderline(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: profCntrl.dropdownvalue,
                        isDense: true,
                        selectedItemBuilder: (context) {
                          return profCntrl.dropItems
                              .map<Widget>((String value) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  value.tr,
                                  textDirection: TextDirection.ltr,
                                  style: GoogleFonts.rubik(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          }).toList();
                        },
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : const Color(0xff050742),
                          ),
                        ),
                        iconSize: 16,
                        elevation: 16,
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.deepPurple,
                        ),
                        onChanged: (newValue) {
                          profCntrl.changeLangu(newValue);
                        },
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Select language..'.tr,
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.raleway(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : const Color(0xff050742),
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        items: profCntrl.dropItems
                            .toSet()
                            .map<DropdownMenuItem<String>>(
                              (langName) => DropdownMenuItem<String>(
                                value: langName,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    langName.toString().tr,
                                    textDirection: TextDirection
                                        .ltr, // Ensure LTR in popup items
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.rubik(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              ListTile(
                dense: true,
                enabled: true,
                enableFeedback: true,
                leading: Container(
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.logout_rounded,
                            size: 20, color: Colors.white))),
                title: Text(
                  'Logout'.tr,
                  style: GoogleFonts.raleway(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey.shade900,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  profCntrl.showDgLogOUT();
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
