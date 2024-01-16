import 'package:flutter/material.dart';

class Cuptextfield extends StatefulWidget {
  // Hint Text
  final String labelText;
  

  const Cuptextfield({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  _TextBoxxState createState() => _TextBoxxState();
}

class _TextBoxxState extends State<Cuptextfield> {
  bool isFocused = false;
  late FocusNode focusNode;

  //Setting passwordObscure to true (default)
  bool passwordObscured = true;

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
            child: TextFormField(
              obscureText: passwordObscured,
              focusNode: focusNode,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFF5450)),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust padding as needed
                  onPressed: () {
                    setState(() {
                      passwordObscured = !passwordObscured;
                    });
                  },
                  icon: Icon(
                    //Is the password Obscure?
                    passwordObscured ? Icons.visibility_off : Icons.visibility,
                    size: 30,
                  ),
                ),

                // Add other decoration properties as needed
                labelText: widget.labelText,
                contentPadding:
                    EdgeInsets.all(10), // Adjust contentPadding as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
