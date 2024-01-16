import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plushare/auth/main_page.dart';
import 'package:plushare/components/button.dart';
import 'package:plushare/components/signuptxt.dart';
import 'package:plushare/pages/createaccount1.dart';
import 'package:plushare/utilities/utils.dart';

class SignUp2 extends StatefulWidget {
  final TextEditingController fname;
  final TextEditingController mname;
  final TextEditingController lname;
  final TextEditingController gender;
  final TextEditingController birth;
  final TextEditingController marital;
  final TextEditingController number;
  const SignUp2({
    Key? key,
    required this.fname,
    required this.mname,
    required this.lname,
    required this.gender,
    required this.birth,
    required this.marital,
    required this.number,
  }) : super(key: key);

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //textController
  TextEditingController _emailController = TextEditingController();

  //Setting passwordObscure to true (default)
  bool passwordObscured = true;

  bool passwordsMatch = true;

  bool _isValidEmail(String email) {
    // Simple email validation using a regular expression
    // You might want to use a more robust validation approach in a real-world scenario
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  //   void dispose() {
  //   fname.dispose();
  //   _mnameController.dispose();
  //   _lnameController.dispose();
  //   _genderController.dispose();
  //   _birthController.dispose();
  //   _maritalController.dispose();
  //   _numberController.dispose();
  //   super.dispose();
  // }

Future signUp() async {
  bool signUpSuccess = false;

  try {
    // Create user with email and password
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    // Add user details
    addUserDetails(
      widget.fname.text,
      widget.mname.text,
      widget.lname.text,
      widget.gender.text,
      widget.birth.text,
      widget.marital.text,
      widget.number.text,
    );

    // Further actions after sign up (if needed)
    // ...

    signUpSuccess = true; // Set the flag to true if sign up is successful
  } on FirebaseAuthException catch (e) {
    // Handle errors during sign up
    print("Error during sign up: $e");
    Utils.showSnackBar(e.message);
  }

  if (signUpSuccess) {
    // Navigate to MainPage only if sign-up was successful
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }
}


  Future addUserDetails(String firstName, String middleName, String lastName,
      String gender, String bday, String marital, String phone) async {
    await FirebaseFirestore.instance.collection('tblUsers').add({
      'first name: ': firstName,
      'middle name: ': middleName,
      'last name: ': lastName,
      'gender: ': gender,
      'birth date: ': bday,
      'marital status: ': marital,
      'phone: ': phone,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/register2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),

                  //Back Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUp1();
                        }));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/back.png',
                            height: 20,
                          ),
                          Image.asset(
                            'assets/back.png',
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 430),

                  // Text(widget.fname.text),
                  // Text(widget.mname.text),
                  // Text(widget.lname.text),
                  // Text(widget.gender.text),
                  // Text(widget.birth.text),
                  // Text(widget.marital.text),
                  // Text(widget.number.text),

                  // Text
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 65, vertical: 3),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5450),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'USER ACCOUNT',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  //Email
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF5450),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Email Textfield
                  Ctextfield(
                    controller: _emailController,
                    padding: EdgeInsets.symmetric(horizontal: 23, vertical: 2),
                    hintText: 'Enter email',
                  ),

                  SizedBox(height: 20),

                  //Password
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF5450),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Password Field
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 23, vertical: 2),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: passwordObscured,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        //CHECK PASS
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
                            passwordObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 5),

                  // Confirm Password Field
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 23, vertical: 2),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(
                  //         color: passwordsMatch
                  //             ? Colors.grey
                  //             : Colors
                  //                 .red, // Adjust border color based on error condition
                  //       ),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 10),
                  //       child: TextField(
                  //         controller: confirmPasswordController,
                  //         obscureText: true,
                  //         decoration: InputDecoration(
                  //           labelText: 'Confirm Password',
                  //           labelStyle: TextStyle(
                  //             color: Colors.grey,
                  //           ),
                  //           errorText: passwordsMatch
                  //               ? null
                  //               : 'Passwords do not match',
                  //           enabledBorder: InputBorder.none,
                  //           focusedBorder: InputBorder.none,
                  //           contentPadding: EdgeInsets.symmetric(
                  //               horizontal: 10, vertical: 5),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
//HERE
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 23, vertical: 2),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: passwordsMatch ? Colors.grey : Colors.red,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              // Check if passwords match
                              passwordsMatch =
                                  _passwordController.text == value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  if (!passwordsMatch)
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF585454),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 104, vertical: 5),
                      child: Text(
                        'Passwords do not match',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
//HERE
                  SizedBox(height: 10),

                  // Sign Up Button
                  MyButton(
                    onTap: () {
                      // Perform validation before signing up
                      if (_emailController.text.isEmpty ||
                          !_isValidEmail(_emailController.text)) {
                        // Show an error message or perform any action for invalid email
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Validation Error'),
                              content:
                                  Text('Please enter a valid email address.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        return; // Stop the sign-up process if email is invalid
                      }

                      if (_passwordController.text.isEmpty ||
                          _passwordController.text.length < 12) {
                        // Show an error message or perform any action for invalid password
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Validation Error'),
                              content: Text(
                                  'Password must be at least 12 characters long.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        return; // Stop the sign-up process if password is invalid
                      }

                      setState(() {
                        passwordsMatch = _passwordController.text ==
                            confirmPasswordController.text;
                      });

                      if (passwordsMatch) {
                        signUp();
                      }
                    },
                    buttcolor: Color(0xFFFF5450),
                    butttext: 'Sign Up',
                    butttextcolor: Colors.white,
                    buttborder: Colors.transparent,
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
