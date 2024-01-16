import 'package:flutter/material.dart';
import 'package:plushare/api/firebase_api.dart';
import 'package:plushare/auth/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plushare/utilities/utils.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  );
}


