import 'package:flutter/material.dart';

class Utils{
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text){
    if (text==null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: Color.fromARGB(255, 82, 82, 82));

    messengerKey.currentState!
     ..removeCurrentSnackBar()
     ..showSnackBar(snackBar);
  }
}