import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/InvoiceScreenController/invoicescreencontroller.dart';

class InvoiceScreen extends StatelessWidget {
  InvoiceScreen({super.key});
  final inVCntrl = Get.put(InvoiceScreenCntrl());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? null
            : Colors.white,
        appBar: AppBar(
          elevation: 0,
          // surfaceTintColor: Theme.of(context).brightness == Brightness.dark
          //     ? null
          //     : Colors.white,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? null
              : Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffECECEC)),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back_ios_new)))),
          titleSpacing: 8,
          title: Text(
            "Invoices",
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey.shade900,
            ),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, index) {
                // final notification = homeCntrl.notiTextView[index];
                // final isReads = homeCntrl.isRead?[index];
                return InkWell(
                  onTap: () {
                    //   homeCntrl.isReadss(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.transparent
                                  : Colors.grey.withOpacity(0.3),
                              blurRadius: 8),
                        ],
                      ),
                      child: ListTile(
                          dense: true,
                          enableFeedback: true,
                          leading: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffE2EDFC),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "${index + 1}",
                                style: GoogleFonts.dmSans(
                                    color: const Color(0xff161661),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          title: Text(
                            "Download".tr,
                            style: GoogleFonts.dmSans(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          // subtitle: Text(
                          //   "homeCntrl.notiSubTextView[index]",
                          //   style: GoogleFonts.inter(
                          //     color:
                          //         Theme.of(context).brightness == Brightness.dark
                          //             ? Colors.white70
                          //             : Colors.black87,
                          //     fontSize: 12,
                          //   ),
                          // ),
                          trailing: const Icon(Icons.download)),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
