import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

toastMessage(String message, [isShort = true, int gravity = 2]) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: isShort ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: gravity == 2
          ? ToastGravity.BOTTOM
          : (gravity == 1 ? ToastGravity.CENTER : ToastGravity.TOP),
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0);
}

// snackBars(String message) {
//   ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
//     content: Text(message),
//     behavior: SnackBarBehavior.floating,
//     duration: const Duration(seconds: 1),
//     backgroundColor: const Color(0xff0EB177),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//   ));
// }
snackBarError(String message) {
  Get.snackbar(
    "",
    "",
    icon: const Icon(Icons.error, color: Colors.red),
    messageText: Text(message.tr,
        style: GoogleFonts.inter(
            color: Colors.black, fontWeight: FontWeight.w400)),
    colorText: const Color(0xff010041),
    titleText: Text("ERROR".tr,
        style: GoogleFonts.raleway(
            color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600)),
  );
}

snackBarInfo(String message) {
  Get.snackbar(
    "",
    "",
    icon: const Icon(Icons.info, color: Color(0xff010041)),
    messageText: Text(message.tr,
        style: GoogleFonts.inter(
            color: Colors.black, fontWeight: FontWeight.w400)),
    colorText: const Color(0xff010041),
    titleText: Text("INFO".tr,
        style: GoogleFonts.raleway(
            color: const Color(0xff010041),
            fontSize: 16,
            fontWeight: FontWeight.w600)),
  );
}

snackBarSuccess(String message) {
  Get.snackbar(
    "",
    "",
    icon: const Icon(Icons.check_rounded, color: Colors.green),
    messageText: Text(message.tr,
        style: GoogleFonts.inter(
            color: Colors.black, fontWeight: FontWeight.w400)),
    colorText: const Color(0xff010041),
    titleText: Text("SUCCESS".tr,
        style: GoogleFonts.raleway(
            color: Colors.green, fontSize: 16, fontWeight: FontWeight.w600)),
  );
}

// Container shimmercontainer(BuildContext context) {
//   return Container(
//     width: MediaQuery.of(context).size.width - 40,
//     height: MediaQuery.of(context).size.height / 1.48,
//     child: Column(
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         Expanded(
//           child: Shimmer.fromColors(
//             baseColor: Colors.grey.shade100,
//             highlightColor: Colors.grey.shade300,
//             // direction: ShimmerDirection.ltr,
//             child: ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (_, __) => Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                         width: 100,
//                         height: 100,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15))),
//                     const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.0)),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 15),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Container(
//                                 width: double.infinity,
//                                 height: 20,
//                                 color: Colors.white),
//                             const Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 2.0)),
//                             Container(
//                                 width: double.infinity,
//                                 height: 20,
//                                 color: Colors.white),
//                             const Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 2.0)),
//                             Container(
//                                 width: 100, height: 20, color: Colors.white),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               itemCount: 10,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
