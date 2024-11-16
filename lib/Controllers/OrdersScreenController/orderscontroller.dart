import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class OrdersScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxBool isOrderLoadss = false.obs;
  TextEditingController inVorderNoController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

//----------------------------------------
  List<Color> leadingClrs = [
    Colors.green,
    Colors.amber,
    Colors.red,
  ];
//---------------------QR Code
  var getResultQR = 'QR Code Result';
  void scanQRCode() async {
    String? res = await SimpleBarcodeScanner.scanBarcode(
      Get.context!,
      barcodeAppBar: const BarcodeAppBar(
        appBarTitle: 'Scan Barcode',
        centerTitle: false,
        enableBackButton: true,
        backButtonIcon: Icon(Icons.arrow_back_ios),
      ),
      isShowFlashIcon: true,
      delayMillis: 2000,
      cameraFace: CameraFace.back,
    );

    inVorderNoController.text = res.toString();

    // try {
    //   String scannedCode = await FlutterBarcodeScanner.scanBarcode(
    //     '#ff6666',
    //     'Cancel',
    //     true,
    //     ScanMode.QR,
    //   );
    //   if (scannedCode != '-1') {
    //     inVorderNoController.text = scannedCode;
    //   }
    // } on PlatformException catch (e) {
    //   toastMessage('Failed to scan QR Code: $e');
    // }
  }

//----------------------------------
}
