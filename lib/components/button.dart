import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final Color buttcolor;
  final Color butttextcolor;
  final Color buttborder;
  final String butttext;
  const MyButton(
      {super.key,
      this.onTap,
      required this.buttcolor,
      required this.butttext,
      required this.butttextcolor,
      required this.buttborder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 55, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: buttcolor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: buttborder,
            )),
        child: Center(
          child: Text(
            butttext,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: butttextcolor,
            ),
          ),
        ),
      ),
    );
  }
}


class MyElevatedButton extends StatelessWidget {
  final VoidCallback? onClicked;
  final Color buttcolor;
  final Color butttextcolor;
  final Color buttborder;
  final String butttext;

  const MyElevatedButton({
    Key? key,
    this.onClicked,
    required this.buttcolor,
    required this.butttextcolor,
    required this.buttborder,
    required this.butttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        primary: buttcolor, // Background color
        onPrimary: butttextcolor, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: buttborder), // Border color
        ),
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
        elevation: 5, // Elevation (shadow)
      ),
      child: Text(
        butttext,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


