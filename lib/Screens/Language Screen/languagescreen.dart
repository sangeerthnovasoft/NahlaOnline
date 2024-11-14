import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/LanguageScreenController/languagecontroller.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});
  final languageCntrl = Get.put(LanguageScreenCntrl());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? null
            : Colors.white,
        appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? null
                : Colors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            title: Padding(
                padding: const EdgeInsets.only(left: 2, top: 8),
                child: Text('Choose your Language'.tr,
                    style: GoogleFonts.inter(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.grey.shade900,
                        fontSize: 23,
                        fontWeight: FontWeight.w600)))),
        body: GetBuilder<LanguageScreenCntrl>(builder: (_) {
          return ListView(physics: const BouncingScrollPhysics(), children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: _.languageCodes.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _.changeLanguage(index);
                    if (languageCntrl.isFirstTap) {
                      languageCntrl.isFirstTap = false;
                    }
                  },
                  child: ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffd69a54).withOpacity(0.7)),
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(_.languageCodes[index],
                                style: GoogleFonts.exo2(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)))),
                    title: Text(languageCntrl.languageNames[index].tr,
                        style: GoogleFonts.inter(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade900,
                            fontWeight: FontWeight.w400)),
                    trailing: languageCntrl.isFirstTap
                        ? null
                        : Icon(
                            _.selectedLanguageIndex == index
                                ? Icons.done
                                : null,
                            color: const Color(0xffd69a54)),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(color: Colors.black12),
                );
              },
            ),
            const SizedBox(height: 30),
          ]);
        }),
      ),
    );
  }
}
