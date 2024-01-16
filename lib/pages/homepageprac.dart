import 'package:flutter/material.dart';
import 'package:plushare/api/pdf_api.dart';
import 'package:plushare/components/boxesbutt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plushare/components/button.dart';
import 'package:plushare/pages/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/homemain.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Logo
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/croplogo.png',
                              width: 160,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 140),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Text('signed in as: ' + user.email!),
                            MaterialButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Login()), // Replace LoginPage with the actual name of your login page
                                );
                              },
                              color: Colors.blue,
                              child: Text('Sign Out'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  //Good Day
                  GreetBox(
                    name: 'Sam Espino',
                  ),

                  SizedBox(height: 25),

                  const Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 55),
                        child: Text(
                          'UPCOMING BLOOD DONATION EVENT',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  //Events
                  const EventBox(
                    date: 'DECEMBER 10, 2023',
                    time: '9:00AM - 4:00PM',
                    venue: 'NU Baliwag Incorporation',
                    fvenue: 'SM Baliwag Complex, Baliuag, Bulacan',
                  ),

                  SizedBox(height: 25),

                  const EventBox(
                    date: 'DECEMBER 27, 2023',
                    time: '7:00AM - 12:00PM',
                    venue: 'Sto. Cristo Barangay Hall',
                    fvenue: 'JMBasa St. Sto Cristo, Baliuag, Bulacan',
                  ),

                  SizedBox(height: 15),

                  //Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[700],
                    ),
                  ),

                  SizedBox(height: 15),

                  //Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoxButtImage(
                        imagePath: 'assets/bloodonate.png',
                        height: 90,
                        width: 149,
                      ),
                      SizedBox(width: 10),
                      BoxButtImage(
                        imagePath: 'assets/checkhos.png',
                        height: 90,
                        width: 149,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  BoxButtImage(
                    imagePath: 'assets/checknear.png',
                    height: 97,
                    width: 303,
                  ),

                  MyElevatedButton(
                      onClicked: () async {
                        final pdfFile = await PdfApi.generate();

                        PdfApi.openFile(pdfFile);
                      },
                      buttcolor: Colors.red,
                      butttext: 'Export Form',
                      butttextcolor: Colors.white,
                      buttborder: Colors.transparent),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
