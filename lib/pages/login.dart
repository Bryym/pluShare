import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plushare/auth/main_page.dart';
import 'package:plushare/components/button.dart';
import 'package:plushare/components/loginemail.dart';
import 'package:plushare/components/loginpass.dart';
import 'package:plushare/pages/createaccount1.dart';


class Login extends StatelessWidget {
  // Remove const for non-constant controllers
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  //Callbacks
  //final VoidCallback showRegisterPage;

  Login({
    super.key,
  });

  void home(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const MainPage();
    }));
  }

  void signup(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SignUp1();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  //Spacing
                  SizedBox(height: 450),

                  //TextFields
                  LogEmailtxt(
                    controller: _emailTextController,
                    labelText: 'Enter your email',
                    imageRed: 'assets/emailred.png',
                    imageGray: 'assets/emailgray.png',
                  ),
                  const SizedBox(height: 40),
                  LogPasstxt(
                    controller: _passwordTextController,
                    labelText: 'Enter your password',
                    imageRed: 'assets/lockred.png',
                    imageGray: 'assets/lockgray.png',
                  ),

                  //Forgot Password
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFFFF5450),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  //Login Button
                  MyButton(
                    // Login Auth
                    onTap: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      )
                          .then((value) {
                        // Authentication successful, navigate to home
                        home(context);
                      }).catchError((error) {
                        // Handle authentication errors
                        print("Error: $error");
                        // Show a snackbar or any other UI indication for invalid credentials
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Invalid credentials. Please check your email and password.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Color.fromARGB(255, 82, 82, 82),
                          ),
                        );
                      });
                    },
                    buttcolor: Color(0xFFFF5450),
                    butttext: 'Log In',
                    butttextcolor: Colors.white,
                    buttborder: Colors.transparent,
                  ),

                  //or
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('or'),
                        SizedBox(width: 10),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Sign Up
                  MyButton(
                    //Login Auth
                    onTap: () {
                      signup(context);
                      //home(context);
                    },
                    buttcolor: Colors.white,
                    butttext: 'Sign Up',
                    butttextcolor: Color(0xFFFF5450),
                    buttborder: Color(0xFFFF5450),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
