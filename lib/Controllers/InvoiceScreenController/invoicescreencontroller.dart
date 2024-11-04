import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nahlaonline/Util/toastsnack.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class InvoiceScreenCntrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxBool isInvLoadss = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

//----------------------------------------
  List invListTxt = [];
//---------------------
  List invListIMG = [];
////------------------------------------------------download

//   Future<void> downloadCourse(int index) async {
//     isDownloadStartedList[index] = true;
//     isDownloadFinishList[index] = false;
//     downloadProgressList[index] = 0;
//     update();
  // var status = await Permission.storage.status;
  // if (status.isDenied) {-
  //   var requestResult =
  //       await Permission.manageExternalStorage.request(); //Storage permission
  //   if (requestResult.isGranted) {
  //     await startDownloadProcess(index);
  //   } else {
  //     openAppSettings();
  //     snackBarError('Storage permission denied');
  //   }
//     } else if (status.isGranted) {
//       await startDownloadProcess(index);
//     }
//   }

// //------------startDownload

//   Future<void> startDownloadProcess(int index) async {
//     while (downloadProgressList[index] < 100) {
//       await Future.delayed(const Duration(milliseconds: 500));
//       downloadProgressList[index] += 10;
//       update();
//       if (downloadProgressList[index] == 100) {
//         isDownloadFinishList[index] = true;
//         isDownloadStartedList[index] = false;
//         update();
//         await saveCourseToFile(index);
//         break;
//       }
//     }
//   }

// //------------------------------------------------------------Save File to path

//   Future<void> saveCourseToFile(int index) async {
//     String courseContent = courseList[index];
//     Directory? appDocDir = await getExternalStorageDirectory();
//     String filePath = '${appDocDir!.path}/course_$index.pdf';
//     File file = File(filePath);
//     await file.writeAsString(courseContent);
//     print('Course saved at: $filePath');
//   }

// //------------------------------------------------------------Opening saved file in ontap from path

//   Future<void> openSavedFile(int index) async {
//     Directory? appDocDir = await getExternalStorageDirectory();
//     String filePath = '${appDocDir!.path}/course_$index.pdf';
//     if (await File(filePath).exists()) {
//       await OpenFile.open(filePath);
//       print('Opening file at: $filePath');
//     } else {
//       snackBarError('File not found at: $filePath');
//     }
//   }
//----------------------------------
}
