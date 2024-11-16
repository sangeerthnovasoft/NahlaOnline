import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/OrderDetailsController/orderdetailscontroller.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({super.key});
  final orderDetCntrl = Get.put(OrderDetailsScreenCntrl());

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
            "Order Details",
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey.shade900,
            ),
          ),
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xffF2F5FC),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Customer Name : ",
                            style: GoogleFonts.rubik(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                        Flexible(
                            child: Text("Nahla Al Wadi",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.rubik(
                                    color: const Color(0xff010041),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400))),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Voucher Number : ",
                            style: GoogleFonts.rubik(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                        Text("1528675B",
                            style: GoogleFonts.rubik(
                                color: const Color(0xff010041),
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Text("Order Time : ",
                                  style: GoogleFonts.rubik(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                              Text('10:31 AM, 16-11-2024',
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                "Total Items : ",
                                style: GoogleFonts.rubik(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '85',
                                style: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : const Color(0xff010041),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Product Name",
                                style: GoogleFonts.rubik(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                            Text("Qty",
                                style: GoogleFonts.rubik(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 6, right: 6, top: 2, bottom: 2),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white24
                              : Colors.grey.shade200,
                        ),
                      ),
                      child: ListTile(
                        dense: true,
                        enableFeedback: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        title: Text(
                          "REIHAN COCOA POWDER SMALL - 20*125 G",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.rubik(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Text(
                          "10.00 CARTON",
                          style: GoogleFonts.rubik(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white54
                                    : const Color(0xff808080),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
