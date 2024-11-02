import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Util/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Controllers/SplashController/splashcontroller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final loginCntrl = Get.put(SplashScreenCntrl());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenCntrl>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
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
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "Nahla Online",
            //   style: GoogleFonts.raleway(
            //       color: const Color(0xffc49a6d),
            //       fontSize: Responsive.isMobile(context) ? 22 : 35,
            //       fontWeight: FontWeight.w600),
            // ),
            Image.asset("assets/images/dashlogo.png",
                height: 120, width: 200, fit: BoxFit.contain),
          ],
        )),
      );
    });
  }
}
