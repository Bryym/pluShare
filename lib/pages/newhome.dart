import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plushare/pages/login.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('signed in as: ' + (user.email ?? 'Unknown')),
            MaterialButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // Navigate to the login page after signing out
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()), // Replace LoginPage with the actual name of your login page
                );
              },
              color: Colors.blue,
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
