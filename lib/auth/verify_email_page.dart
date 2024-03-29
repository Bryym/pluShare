// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plushare/pages/homepageprac.dart';
import 'package:plushare/utilities/utils.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState(){
    super.initState();

    //user needs to be created first
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified){
      sendVerificationEmail();

      Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  //dispose if it is not needed anymore
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async{
    //call after email verification
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified) timer?.cancel();
  }


  Future sendVerificationEmail() async{
    try {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();

    setState (()=> canResendEmail = false);
    await Future.delayed(Duration(seconds: 30));
    setState (()=> canResendEmail = true);

    }catch (e) {
      Utils.showSnackBar(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) =>isEmailVerified
  ? HomePage()
  :Scaffold(
    appBar: AppBar(
      title: Text('Verify Email'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('A verification email has been sent to your email.',
          style: TextStyle(fontSize:20),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
          ),
          icon: Icon(Icons.email, size:32),
          label: Text(
            'Resend Email',
            style: TextStyle(fontSize: 24),
          ), onPressed: canResendEmail ? sendVerificationEmail : null,
          ),
          SizedBox(height: 8),
          TextButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: 24),
            ),onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
    ),
  );
  
}