// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   _initializeLocalNotifications();

//   runApp(MyApp());
// }

// void _initializeLocalNotifications() {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('app_icon');
//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//   );
//   flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//     onSelectNotification: _onSelectNotification,
//   );
// }

// Future _onSelectNotification(String payload) async {
//   // Handle notification click
// }
