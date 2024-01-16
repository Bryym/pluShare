import 'package:flutter/material.dart';
import 'package:plushare/components/button.dart';
import 'package:plushare/components/signuptxt.dart';
import 'package:plushare/pages/createaccount2.dart';
import 'package:plushare/pages/login.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp1> createState() => _MyWidgetState();
}

List<String> options = ['Male', 'Female'];
String currentOption = ''; // Add this line

class _MyWidgetState extends State<SignUp1> {
  //For Date Picker
  TextEditingController _birthController = TextEditingController();
  //For SignUp
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _mnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _maritalController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  final _maritalList = [
    '--Choose--',
    'Single',
    'Married',
    'Divorced',
    'Widowed'
  ];
  String? _selectedVal = '--Choose--';

  //For date selection
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xFFFF5450),
            hintColor: Colors.green,
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFF5450),
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (_picked != null) {
      setState(() {
        _birthController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  // void next(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return const SignUp2();
  //   }));
  // }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/registerpage1.png'),
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
                  //Spacing
                  SizedBox(height: 20),

                  //Back Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
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

                  SizedBox(height: 250),

                  //Text
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5450),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'PERSONAL INFORMATION',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  //Name
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF5450),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Name Textfield
                  Ctextfield(
                    controller: _fnameController,
                    padding: EdgeInsets.symmetric(horizontal: 23, vertical: 2),
                    hintText: 'First Name',
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Ctextfield(
                            controller: _mnameController,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 3),
                            hintText: 'Middle Name',
                          ),
                        ),
                        Expanded(
                          child: Ctextfield(
                            controller: _lnameController,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 3),
                            hintText: 'Last Name',
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  //Gender
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29),
                    child: Row(
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF5450),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: const Text('Male'),
                            value: options[0],
                            groupValue: _genderController
                                .text, // Use the controller's value
                            onChanged: (value) {
                              setState(() {
                                _genderController.text = value.toString();
                              });
                            },
                            activeColor: Color(0xFFFF5450),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: const Text('Female'),
                            value: options[1],
                            groupValue: _genderController
                                .text, // Use the controller's value
                            onChanged: (value) {
                              setState(() {
                                _genderController.text = value.toString();
                              });
                            },
                            activeColor: Color(0xFFFF5450),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Date of Birth
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29),
                    child: Row(
                      children: [
                        Text(
                          'Date of Birth',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF5450),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: _birthController,
                      decoration: InputDecoration(
                        hintText: 'YY-mm-dd',
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFFF5450),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate();
                      },
                    ),
                  ),

                  SizedBox(height: 10),

                  //Marital Status
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29),
                    child: Row(
                      children: [
                        Text(
                          'Marital Status',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF5450),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: DropdownButtonFormField(
                        value: _selectedVal,
                        items: _maritalList
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedVal = val as String?;
                            //to use controller and get value
                            _maritalController.text = _selectedVal ?? '';
                          });
                        },
                        decoration: const InputDecoration(
                          // Set the decoration to collapsed to remove the default underline
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //Phone
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29),
                    child: Row(
                      children: [
                        Text(
                          'Phone',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF5450),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Phone Textfield
                  Ctextfield(
                    controller: _numberController,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                    hintText: '09XX-XXX-XXXX',
                    keyboardType: TextInputType.phone,
                  ),

                  SizedBox(height: 20),

                  //Next Button
                  MyButton(
                    onTap: () {
                      // Perform validation before navigating to the next screen
                      if (_fnameController.text.isEmpty ||
                          _mnameController.text.isEmpty ||
                          _lnameController.text.isEmpty ||
                          _genderController.text.isEmpty ||
                          _birthController.text.isEmpty ||
                          _maritalController.text.isEmpty ||
                          _numberController.text.isEmpty ||
                          _maritalController.text == "--Choose--") {
                        // Show an error message or perform any action for invalid input
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Validation Error'),
                              content: Text(
                                  'Please fill in all fields before proceeding.'),
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
                      } else {
                        // All fields are filled, navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUp2(
                                fname: _fnameController,
                                mname: _mnameController,
                                lname: _lnameController,
                                gender: _genderController,
                                birth: _birthController,
                                marital: _maritalController,
                                number: _numberController,
                              );
                            },
                          ),
                        );
                      }
                    },
                    buttcolor: Color(0xFFFF5450),
                    butttext: 'Next',
                    butttextcolor: Colors.white,
                    buttborder: Colors.transparent,
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
