import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:nahlaonline/Screens/SplashScreen/splash.dart';

Future handleBackgroundMessage(RemoteMessage message) async {}

class FireBaseAPI {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  final AndroidNotificationChannel _androidChannel =
      const AndroidNotificationChannel(
    'your_channel_id',
    'Your Channel Name',
    importance: Importance.high,
    enableLights: true,
    playSound: true,
    enableVibration: true,
    showBadge: true,
  );

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      announcement: false,
    );
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifications();
    initLocalNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    Get.toNamed(SplashScreen.route, arguments: message);
  }

  Future<void> initLocalNotifications() async {
    final iOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      defaultPresentSound: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );

    const AndroidInitializationSettings android =
        AndroidInitializationSettings('@drawable/ic_launcher');

    final InitializationSettings settings =
        InitializationSettings(android: android, iOS: iOS, macOS: iOS);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) async {
        final message =
            RemoteMessage.fromMap(jsonDecode(details.payload ?? '{}'));
        handleMessage(message);
      },
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);
  }

  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen((handleMessage));
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification != null && notification.title != null) {
        _localNotifications.show(
          notification.hashCode,
          notification.title!,
          notification.body ?? '',
          NotificationDetails(
              android: AndroidNotificationDetails(
                _androidChannel.id,
                _androidChannel.name,
                channelDescription: _androidChannel.description,
                icon: '@drawable/ic_launcher',
                importance: Importance.max,
                priority: Priority.max,
                enableLights: true,
                enableVibration: true,
                playSound: true,
              ),
              iOS: const DarwinNotificationDetails(
                sound: 'default',
                presentSound: true,
                presentAlert: true,
                presentBadge: true,
              )),
          payload: jsonEncode(message.toMap()),
        );
      }
    });
  }
}
