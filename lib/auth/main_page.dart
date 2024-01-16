import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plushare/auth/auth_page.dart';
import 'package:plushare/auth/verify_email_page.dart';
import 'package:plushare/main.dart';
import 'package:plushare/pages/homepage.dart';
import 'package:plushare/pages/homepageprac.dart';
import 'package:plushare/pages/login.dart';
import 'package:plushare/pages/newhome.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //Checking for any AUth state changes
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const VerifyEmailPage();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
