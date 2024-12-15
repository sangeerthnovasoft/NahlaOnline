import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Controllers/RegisterController/registercontroller.dart';
import 'package:nahlaonline/Util/toastsnack.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final RxBool isInvLoadss = false.obs;
  List<dynamic> salesInvData = [];
  int pageNumber = 1;
  bool isFetchingMore = false;
  bool hasMoreData = true;
  List<bool> isDownloadStartedList = [];
  List<bool> isDownloadFinishList = [];
  List<int> downloadProgressList = [];

  @override
  void onInit() {
    fetchSalesInvoice(pageNumber: pageNumber);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageNumber++;
        fetchSalesInvoice(pageNumber: pageNumber);
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

//----------------------------------------Invoice/Sales API

  Future<void> fetchSalesInvoice({pageNumber}) async {
    if (isFetchingMore || !hasMoreData) return;
    isFetchingMore = true;
    update();
    final prefs = await SharedPreferences.getInstance();
    final selectedLanguageCode = prefs.getString('selectedLanguageCode') ?? '1';
    final langId = (selectedLanguageCode == 'en') ? '1' : '2';
    final refreshToken = prefs.getString('refreshToken');
    final url = Uri.parse('$apiURL/Invoice/Sales');
    final headers = {'Content-Type': 'application/json'};
    final body = {
      "LangID": langId,
      "RefreshToken": "ZE4Ok7610uwy0lZMLE6OAtJek5UuzC0OdxDaQNRAig",
      "PageNumber": pageNumber
    };
    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final error = jsonResponse['error'];
        final message = jsonResponse['message'];
        if (error == false) {
          final newData = jsonResponse['data'] ?? [];
          if (newData.isEmpty) {
            hasMoreData = false; // No more data
          } else {
            salesInvData.addAll(newData); // Append new data
            extendDownloadLists(newData.length);
          }
          // salesInvData.addAll(jsonResponse['data']);
          // salesInvData = jsonResponse['data'];
        } else {
          toastMessage("$message");
        }
      } else {
        toastMessage("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      toastMessage("An exception occurred: $e");
    } finally {
      isFetchingMore = false;
      update();
    }
  }

////------------------------------------------------download
  void extendDownloadLists(int newItemsCount) {
    isDownloadStartedList.addAll(List<bool>.filled(newItemsCount, false));
    isDownloadFinishList.addAll(List<bool>.filled(newItemsCount, false));
    downloadProgressList.addAll(List<int>.filled(newItemsCount, 0));
  }

  Future<void> downloadCourse(int index) async {
    isDownloadStartedList[index] = true;
    isDownloadFinishList[index] = false;
    downloadProgressList[index] = 0;
    update();
    var status = await Permission.storage.status;
    if (status.isDenied) {
      var requestResult =
          await Permission.manageExternalStorage.request(); //Storage permission
      if (requestResult.isGranted) {
        await startDownloadProcess(index);
      } else {
        openAppSettings();
        snackBarError('Storage permission denied');
      }
    } else if (status.isGranted) {
      await startDownloadProcess(index);
    }
  }

//------------startDownload

  Future<void> startDownloadProcess(int index) async {
    while (downloadProgressList[index] < 100) {
      await Future.delayed(const Duration(milliseconds: 500));
      downloadProgressList[index] += 10;
      update();
      if (downloadProgressList[index] == 100) {
        isDownloadFinishList[index] = true;
        isDownloadStartedList[index] = false;
        update();
        await saveCourseToFile(index);
        break;
      }
    }
  }

//------------------------------------------------------------Save File to path

  Future<void> saveCourseToFile(int index) async {
    String courseContent = salesInvData[index]['invoiceURL'];
    if (courseContent is Map) {
      courseContent = jsonEncode(courseContent); // Convert map to JSON string
    }
    Directory? appDocDir = await getExternalStorageDirectory();
    String filePath = '${appDocDir!.path}/Invoice.pdf';
    File file = File(filePath);
    await file.writeAsString(courseContent); // Write the content to the file
    print('Course saved at: $filePath');
  }
//------------------------------------------------------------Opening saved file in ontap from path

  Future<void> openSavedFile(int index) async {
    Directory? appDocDir = await getExternalStorageDirectory();
    String filePath = '${appDocDir!.path}/Invoice.pdf';
    if (await File(filePath).exists()) {
      await OpenFile.open(filePath);
      print('Opening file at: $filePath');
    } else {
      snackBarError('File not found at: $filePath');
    }
  }
//----------------------------------
}
