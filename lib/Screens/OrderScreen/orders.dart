import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/OrdersScreenController/orderscontroller.dart';
import 'package:nahlaonline/Screens/OrderDetailsScreen/orderdetails.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final orderSCntrl = Get.put(OrdersScreenCntrl());
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: GetBuilder<OrdersScreenCntrl>(builder: (_) {
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
                "Orders",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.grey.shade900,
                ),
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.all(12),
                    child: InkWell(
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
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (ctxDialog) => Scaffold(
                              backgroundColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.black54
                                  : Colors.transparent,
                              body: Stack(
                                children: <Widget>[
                                  AlertDialog(
                                    shadowColor: Colors.black,
                                    shape: const BeveledRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    backgroundColor:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.black
                                            : Colors.white,
                                    surfaceTintColor:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.black
                                            : Colors.white,
                                    titlePadding: EdgeInsets.zero,
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Add New Invoice',
                                            style: GoogleFonts.raleway(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.grey.shade800,
                                            ),
                                          ),
                                        ),
                                        Divider(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.grey.shade100
                                                    : Colors.grey.shade200),
                                      ],
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            TextFormField(
                                              textDirection: TextDirection.ltr,
                                              controller: orderSCntrl
                                                  .inVorderNoController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              autocorrect: false,
                                              enableSuggestions: false,
                                              keyboardType:
                                                  TextInputType.number,
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              style: GoogleFonts.inter(
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isNotEmpty) {
                                                  return null;
                                                }
                                                return "Inv No. can't be empty";
                                              },
                                              onChanged: (text) {},
                                              textAlign: TextAlign.start,
                                              decoration: InputDecoration(
                                                counterText: "",
                                                hintText:
                                                    "Please enter your Inv No."
                                                        .tr,
                                                hintStyle: GoogleFonts.raleway(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white70
                                                        : Colors.black54,
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                prefixIcon: Icon(
                                                  Icons.inventory_rounded,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white70
                                                      : Colors.black54,
                                                  size: 20,
                                                ),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 8),
                                                border:
                                                    const OutlineInputBorder(),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xffC9E0FF),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0xffc49a6d),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xffC9E0FF),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            Text(
                                              "--- OR ---",
                                              style: GoogleFonts.raleway(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Tap below barcode to start scan",
                                              style: GoogleFonts.raleway(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            InkWell(
                                              onTap: () {
                                                orderSCntrl.scanQRCode();
                                              },
                                              child: Image.asset(
                                                "assets/images/barcode.png",
                                                fit: BoxFit.contain,
                                                height: 60,
                                              ),
                                            ),
                                            const SizedBox(height: 40),
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Container(
                                                  width: double.maxFinite,
                                                  height: 40,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(8),
                                                      color:
                                                          const Color(
                                                              0xffd69a54)),
                                                  child: Material(
                                                      type:
                                                          MaterialType
                                                              .transparency,
                                                      child: Text("Add Order".tr,
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1)))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 6.5,
                                      right: 12,
                                    ),
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.red,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                            width: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black
                                    : Colors.grey.shade100,
                                border:
                                    Border.all(color: const Color(0xffECECEC)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ))))),
              ],
            ),
            body: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 6, right: 6, top: 4, bottom: 4),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.black
                              : Colors.white,
                          border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white24
                                  : Colors.grey.shade200),
                        ),
                        child: InkWell(
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
                          onTap: () {
                            Get.to(() => OrderDetailsScreen());
                          },
                          child: ListTile(
                            dense: true,
                            enableFeedback: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            leading: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: orderSCntrl.leadingClrs[index],
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: orderSCntrl.leadingClrs[index] ==
                                          Colors.green
                                      ? const Icon(Icons.check_rounded,
                                          color: Colors.white)
                                      : orderSCntrl.leadingClrs[index] ==
                                              Colors.amber
                                          ? const Icon(
                                              Icons.priority_high_rounded,
                                              color: Colors.white)
                                          : const Icon(Icons.timelapse_rounded,
                                              color: Colors.white)),
                            ),
                            title: Text(
                              "Customer Name",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.rubik(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order No : 15286350",
                                      style: GoogleFonts.rubik(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white54
                                            : const Color(0xff808080),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Amount: 1520.00 SAR",
                                      style: GoogleFonts.rubik(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white54
                                            : const Color(0xff808080),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Status : ",
                                          style: GoogleFonts.rubik(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white54
                                                    : const Color(0xff808080),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          orderSCntrl.leadingClrs[index] ==
                                                  Colors.green
                                              ? "Finished"
                                              : orderSCntrl
                                                          .leadingClrs[index] ==
                                                      Colors.amber
                                                  ? "Assigned"
                                                  : "Not Assigned",
                                          style: GoogleFonts.rubik(
                                            color: orderSCntrl
                                                        .leadingClrs[index] ==
                                                    Colors.green
                                                ? Colors.green
                                                : orderSCntrl.leadingClrs[
                                                            index] ==
                                                        Colors.amber
                                                    ? Colors.amber
                                                    : Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Last Updated : 6:00 PM",
                                      style: GoogleFonts.rubik(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white54
                                            : const Color(0xff808080),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),

            // body: ListView(
            //   shrinkWrap: true,
            //   physics: const BouncingScrollPhysics(),
            //   children: [
            //     ListView.builder(
            //       shrinkWrap: true,
            //       physics: const BouncingScrollPhysics(),
            //       itemCount: 15,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.only(
            //               left: 6, right: 6, top: 4, bottom: 4),
            //           child: Container(
            //             width: MediaQuery.of(context).size.width,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(8),
            //               color: Theme.of(context).brightness == Brightness.dark
            //                   ? Colors.black
            //                   : Colors.white,
            //               border: Border.all(
            //                   color: Theme.of(context).brightness ==
            //                           Brightness.dark
            //                       ? Colors.white24
            //                       : Colors.grey.shade200),
            //               // boxShadow: [
            //               //   BoxShadow(
            //               //     color: Theme.of(context).brightness ==
            //               //             Brightness.dark
            //               //         ? Colors.white
            //               //         : Colors.grey.shade200,
            //               //     blurRadius: 1,
            //               //   )
            //               // ],
            //             ),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   height: 80,
            //                   width: 9,
            //                   decoration: const BoxDecoration(
            //                     borderRadius: BorderRadius.only(
            //                         topLeft: Radius.circular(8),
            //                         bottomLeft: Radius.circular(8)),
            //                     color: Colors.green,
            //                   ),
            //                 ),
            //                 Expanded(
            //                   child: ListTile(
            //                     dense: true,
            //                     enableFeedback: true,
            //                     contentPadding:
            //                         const EdgeInsets.symmetric(horizontal: 10),
            //                     title: Text(
            //                       "Customer Name",
            //                       style: GoogleFonts.rubik(
            //                         color: Theme.of(context).brightness ==
            //                                 Brightness.dark
            //                             ? Colors.white
            //                             : Colors.black,
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.w400,
            //                       ),
            //                     ),
            //                     subtitle: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             Text(
            //                               "Order No : 15286350",
            //                               style: GoogleFonts.rubik(
            //                                 color:
            //                                     Theme.of(context).brightness ==
            //                                             Brightness.dark
            //                                         ? Colors.white54
            //                                         : const Color(0xff808080),
            //                                 fontSize: 12,
            //                                 fontWeight: FontWeight.w400,
            //                               ),
            //                             ),
            //                             Text(
            //                               "Amount: 152.00 SAR",
            //                               style: GoogleFonts.rubik(
            //                                 color:
            //                                     Theme.of(context).brightness ==
            //                                             Brightness.dark
            //                                         ? Colors.white54
            //                                         : const Color(0xff808080),
            //                                 fontSize: 12,
            //                                 fontWeight: FontWeight.w400,
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                         Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             Row(
            //                               children: [
            //                                 Text(
            //                                   "Status : ",
            //                                   style: GoogleFonts.rubik(
            //                                     color: Theme.of(context)
            //                                                 .brightness ==
            //                                             Brightness.dark
            //                                         ? Colors.white54
            //                                         : const Color(0xff808080),
            //                                     fontSize: 12,
            //                                     fontWeight: FontWeight.w400,
            //                                   ),
            //                                 ),
            //                                 Text(
            //                                   "Not Assigned",
            //                                   style: GoogleFonts.rubik(
            //                                     color: Colors.red,
            //                                     fontSize: 12,
            //                                     fontWeight: FontWeight.w400,
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             Text(
            //                               "Last Update on : 6:00 PM",
            //                               style: GoogleFonts.rubik(
            //                                 color:
            //                                     Theme.of(context).brightness ==
            //                                             Brightness.dark
            //                                         ? Colors.white54
            //                                         : const Color(0xff808080),
            //                                 fontSize: 12,
            //                                 fontWeight: FontWeight.w400,
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //     )
            //   ],
            // ),
          );
        }));
  }
}
