import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Screens/InvoiceScreen/invoicescreen.dart';

class HomeScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxBool isLoginLoadss = false.obs;
  final FocusNode searchFocusNode = FocusNode();
  // final PageController pageController = PageController();
  // Timer? timer;

  @override
  void onInit() {
    // timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
    //   if (pageController.page == posters.length - 1) {
    //     pageController.jumpToPage(0);
    //   } else {
    //     pageController.nextPage(
    //       duration: const Duration(milliseconds: 600),
    //       curve: Curves.easeInOut,
    //     );
    //   }
    // });
    super.onInit();
  }

  @override
  void dispose() {
    // timer?.cancel();
    // pageController.dispose();
    super.dispose();
  }

//---------------------
  int currentPage = 0;
  List posters = [
    'https://k.nooncdn.com/cms/pages/20210811/e65a73dab849149ea6a0dbd0434c53ea/en_slider-cashbackCode-01-KSA.png',
    'https://k.nooncdn.com/cms/pages/20210517/645b720c43c1602893e698b6fef28b7d/en_banner-01-ksa.png',
    'https://k.nooncdn.com/cms/pages/20210811/9092575ef9f81b475e6f6a09aa36eae6/en_hero-01.png',
    'https://k.nooncdn.com/cms/pages/20210813/96edcb70d7034eb318da2189f8623256/en_slider-01-ksa.png',
  ];
  // List posters = [
  //   "assets/images/banner.jpg",
  // ];
//----------------------------------
  pageCarousal(index) {
    currentPage = index;
    update();
  }

  //-------------------------------

  List gridText = [
    "Invoices",
  ];
  List imageList = [
    "assets/images/invoice.png",
  ];

//----------------------------------navigateToScreen
  void navigateToScreen(int index) {
    if (gridText[index] == "Invoices") {
      Get.to(() => InvoiceScreen());
    }
  }

  //-----------------------------
  //--------
  Future<List<String>> fetchHomeSearchData(pattern) async {
    return [];
  }
//----------------------------------
}
