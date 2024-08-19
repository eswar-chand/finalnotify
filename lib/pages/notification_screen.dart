// import 'package:flutter/material.dart';
// import 'package:notify/api/firebase_api.dart';
// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});
//   static const route ='/notification-screen';
//   @override
//   Widget build(BuildContext context) {
//     final message=ModalRoute.of(context)!.settings.arguments;
//     return Scaffold(
//       backgroundColor: Colors.purple[400],
//       appBar: AppBar(
//         backgroundColor: Colors.purple[700],
//         title: Text(
//           'Notifications Page',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child:Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:[
//             Text('${message?.notification?.title}'),
//             Text('${message?.notification?.body}'),
//             Text('${message?.data}'),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Assuming you're using Firebase Messaging for notifications

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const route = '/notification-screen';

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage?;

    return Scaffold(
      backgroundColor: Colors.purple[400],
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: const Text(
          'Notifications Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message?.notification?.title ?? 'No Title',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message?.notification?.body ?? 'No Body',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message?.data.toString() ?? 'No Data',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
