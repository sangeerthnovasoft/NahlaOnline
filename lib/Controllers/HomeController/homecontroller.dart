import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Controllers/RegisterController/registercontroller.dart';
import 'package:nahlaonline/Screens/InvoiceScreen/invoicescreen.dart';
import 'package:nahlaonline/Screens/OrderScreen/orders.dart';
import 'package:nahlaonline/Util/toastsnack.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxBool isLoginLoadss = false.obs;
  final FocusNode searchFocusNode = FocusNode();
  RxBool isHomeLoads = false.obs;
  List<Map<String, dynamic>> mainSliders = [];
  List<Map<String, dynamic>> quickLinks = [];
  String username = '';

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

  // List gridText = [
  //   "Invoices",
  //   "Orders",
  //   "Online",
  // ];
  List imageList = [
    "assets/images/invoice.png",
    "assets/images/orders.png",
    "assets/images/online.png",
  ];

//----------------------------------navigateToScreen
  Future<void> navigateToScreen(int index, {String? gridName}) async {
    if (gridName == "Invoices") {
      //Storage permission
      var status = await Permission.storage.status;
      if (status.isDenied) {
        var requestResult = await Permission.manageExternalStorage.request();
        if (requestResult.isGranted) {
          await Get.to(() => InvoiceScreen());
        } else {
          openAppSettings();
          snackBarError('Storage permission denied');
        }
      } else {
        await Get.to(() => InvoiceScreen());
      }
    } else if (gridName == "Orders") {
      Get.to(() => OrdersScreen());
    } else if (gridName == "Online") {
      // Get.to(() => ());
    }
  }

  //-----------------------------
  HomeData? homeData;
  Future<void> fetchHomeData({String? refreshToken}) async {
    isHomeLoads.value = true;
    final prefs = await SharedPreferences.getInstance();
    final selectedLanguageCode = prefs.getString('selectedLanguageCode') ?? '1';
    final langId = (selectedLanguageCode == 'en') ? '1' : '2';
    final url = Uri.parse('$apiURL/GetHomeData');
    final headers = {'Content-Type': 'application/json'};
    final body = {
      "LangID": langId,
      "RefreshToken": refreshToken.toString(),
    };
    log("Body : $body");
    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final error = jsonResponse['error'];
        final message = jsonResponse['message'];
        if (error == false) {
          homeData = HomeData.fromJson(jsonResponse['data']);
        } else {
          toastMessage("$message");
        }
      } else {
        toastMessage("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      toastMessage("An exception occurred: $e");
    } finally {
      isHomeLoads.value = false;
      update();
    }
  }

  //----------------------------

  Future<List<String>> fetchHomeSearchData(pattern) async {
    return [];
  }
//----------------------------------
}

class HomeData {
  final String username;
  final bool showMainSlider;
  final bool enableMainSlider;
  final List<SliderData> mainSliders;
  final bool showQuickLinks;
  final List<QuickLink> quickLinks;

  HomeData({
    required this.username,
    required this.showMainSlider,
    required this.enableMainSlider,
    required this.mainSliders,
    required this.showQuickLinks,
    required this.quickLinks,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      username: json['username'],
      showMainSlider: json['showMainSlider'],
      enableMainSlider: json['enableMainSlider'],
      mainSliders: (json['mainSliders'] as List)
          .map((item) => SliderData.fromJson(item))
          .toList(),
      showQuickLinks: json['showQuickLinks'],
      quickLinks: (json['quickLinks'] as List)
          .map((item) => QuickLink.fromJson(item))
          .toList(),
    );
  }
}

class SliderData {
  final String sliderHead;
  final String sliderURL;
  final String navTo;
  final int navID;

  SliderData({
    required this.sliderHead,
    required this.sliderURL,
    required this.navTo,
    required this.navID,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) {
    return SliderData(
      sliderHead: json['sliderHead'],
      sliderURL: json['sliderURL'],
      navTo: json['navTo'],
      navID: json['navID'],
    );
  }
}

class QuickLink {
  final String link;
  final bool show;

  QuickLink({required this.link, required this.show});

  factory QuickLink.fromJson(Map<String, dynamic> json) {
    return QuickLink(
      link: json['link'],
      show: json['show'],
    );
  }
}
