import 'package:flutter/material.dart';

class LogEmailtxt extends StatefulWidget {
  // Hint Text
  final String labelText;
  // Image change
  final String imageRed;
  final String imageGray;
  final controller;

  const LogEmailtxt(
      {Key? key,
      required this.labelText,
      required this.imageRed,
      required this.imageGray, this.controller})
      : super(key: key);

  @override
  _TextBoxxState createState() => _TextBoxxState();
}

class _TextBoxxState extends State<LogEmailtxt> {
  bool isFocused = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Wrap the Image.asset with a Container to set its width
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                // Makes the image as prefix icon
                prefixIcon: Container(
                  padding: EdgeInsets.all(10), // Adjust padding as needed
                  margin: EdgeInsets.only(right: 10), // Adjust margin as needed
                  child: Image.asset(
                    isFocused
                        ? widget.imageRed // Change to the focused image
                        : widget.imageGray, // Default image
                    height: 30,
                  ),
                ),
                // Suffix icon on the right side
                suffixIcon: Container(
                  padding: EdgeInsets.all(10), // Adjust padding as needed
                  margin: EdgeInsets.only(right: 10), // Adjust margin as needed
                  child: Opacity(
                    opacity:  isFocused ? 1.0 : 0.0,
                    child: Image.asset(
                      isFocused
                          ? 'assets/checkred.png' // Change to the focused image
                          : 'assets/checkgray.png', // Default image
                      height: 30,
                    ),
                  ),
                ),
                // Default Color
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Set the line color
                  ),
                ),
                // Focused Color
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red, // Set the focused line color
                  ),
                ),
                // Add other decoration properties as needed
                labelText: widget.labelText,
                contentPadding: EdgeInsets.all(10), // Adjust contentPadding as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
