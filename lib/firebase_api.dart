import 'package:finalnotify/pages/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'main.dart';

Future <void> handleBackgroundMessage(RemoteMessage message) async{
  print('Title : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');
}
class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      NotificationScreen.route,
      arguments: message,
    );
  }
  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the message while the app is in the foreground
      print('Message received: ${message.notification?.title}');
      // You can show an in-app notification or update the UI here
    });
    // FirebaseMessaging.onMessage.listen((message) {
    //   final notification = message.notification;
    //   if (notification == null) return;
    //
    //   _localNotifications.show(
    //     notification.hashCode,
    //     notification.title,
    //     notification.body,
    //     NotificationDetails(
    //       android: AndroidNotificationDetails(
    //         _androidChannel.id,
    //         _androidChannel.name,
    //         channelDescription: _androidChannel.description,
    //         icon: '@drawable/ic_launcher',
    //       ),
    //     ),
    //     payload: jsonEncode(message.toMap()),
    //   );
    // });
  }


  Future <void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fMCMToken = await _firebaseMessaging.getToken();
    print("Token : $fMCMToken");
    //cf4MWd2ZQyi1GS01lOfY5Q:APA91bGjegkkq2h6eqGS9pwUgSALFp1bOP0u0X-SqPz8pLXTtt5au5LE4R-pp0hULLvsVQAjsVkm2xm8trTGly3bG7YohQAgyXaXnKaphG8UXu4cyz4hjPI2pIjlw3p7_ER86kENC9Hf
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifications();

  }
}