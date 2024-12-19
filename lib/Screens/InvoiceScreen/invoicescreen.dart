import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/InvoiceScreenController/invoicescreencontroller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class InvoiceScreen extends StatelessWidget {
  String? refreshToken;
  InvoiceScreen({super.key, this.refreshToken});
  final inVCntrl = Get.put(InvoiceScreenCntrl());

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: GetBuilder<InvoiceScreenCntrl>(builder: (_) {
          return Scaffold(
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
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffECECEC)),
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
            body: inVCntrl.salesInvData.isEmpty
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset("assets/images/empty.png",
                                fit: BoxFit.contain)),
                        const SizedBox(height: 8),
                        Text(
                          "No data found..",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                              color: const Color(0xff161661),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                : ListView(
                    controller: inVCntrl.scrollController,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: inVCntrl.salesInvData.length,
                          itemBuilder: (context, index) {
                            final saleINV = inVCntrl.salesInvData[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
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
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        "${index + 1}",
                                        style: GoogleFonts.dmSans(
                                            color: const Color(0xff161661),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  title: Text(saleINV["billingName"],
                                      style: GoogleFonts.dmSans(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Inv No: ${saleINV["invoiceNumber"]}",
                                        style: GoogleFonts.inter(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white70
                                                    : Colors.black87,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11),
                                      ),
                                      Text(
                                        saleINV["createdDate"],
                                        style: GoogleFonts.inter(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white70
                                                    : Colors.black87,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  trailing: saleINV["invoiceStatus"] ==
                                          "Not Available"
                                      ? const SizedBox.shrink()
                                      : Column(
                                          children: [
                                            Visibility(
                                              visible: inVCntrl
                                                          .isDownloadStartedList
                                                          .length >
                                                      index &&
                                                  inVCntrl.isDownloadStartedList[
                                                      index],
                                              child: CircularPercentIndicator(
                                                radius: 20.0,
                                                lineWidth: 3.0,
                                                percent: (inVCntrl
                                                            .downloadProgressList[
                                                        index] /
                                                    100),
                                                center: Text(
                                                  "${inVCntrl.downloadProgressList[index]}%",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? null
                                                          : const Color(
                                                              0xff010041)),
                                                ),
                                                progressColor: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.green
                                                    : const Color(0xff010041),
                                              ),
                                            ),
                                            Visibility(
                                              visible: inVCntrl
                                                          .isDownloadStartedList
                                                          .length >
                                                      index &&
                                                  !inVCntrl
                                                          .isDownloadStartedList[
                                                      index],
                                              child: IconButton(
                                                icon: inVCntrl
                                                            .isDownloadFinishList[
                                                        index]
                                                    ? Image.asset(
                                                        "assets/images/pdf.png",
                                                        fit: BoxFit.contain,
                                                        height: 28,
                                                      )
                                                    : Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark
                                                                    ? const Color(
                                                                        0xffECECEC)
                                                                    : const Color(
                                                                        0xffECECEC)),
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? null
                                                                : const Color(
                                                                    0xffECECEC),
                                                            shape: BoxShape
                                                                .circle),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(6),
                                                          child: Icon(
                                                            Icons
                                                                .download_rounded,
                                                            size: 18,
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? Colors.white70
                                                                : const Color(
                                                                    0xff010041),
                                                          ),
                                                        )),
                                                color:
                                                    inVCntrl.isDownloadFinishList[
                                                            index]
                                                        ? const Color.fromARGB(
                                                            255, 20, 156, 24)
                                                        : Colors.grey,
                                                onPressed: () async {
                                                  if (inVCntrl
                                                          .isDownloadFinishList[
                                                      index]) {
                                                    await inVCntrl
                                                        .openSavedFile(index);
                                                  } else {
                                                    inVCntrl
                                                        .downloadCourse(index);
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 6);
                          }),
                      inVCntrl.isFetchingMore == true
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 15, bottom: 15),
                                child: LinearProgressIndicator(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? null
                                        : const Color(0xff010041)),
                              ),
                            )
                          : const SizedBox(height: 30),
                      inVCntrl.hasMoreData == false
                          ? const SizedBox()
                          : const SizedBox(height: 30),
                    ],
                  ),
          );
        }));
  }
}
