// class YourWidget extends StatefulWidget {
//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }

// class _YourWidgetState extends State<YourWidget> {
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   bool passwordsMatch = true;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 2),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: passwordsMatch ? Colors.grey : Colors.red,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: TextField(
//                 controller: confirmPasswordController,
//                 obscureText: true,
//                 onChanged: (value) {
//                   setState(() {
//                     // Check if passwords match
//                     passwordsMatch = passwordController.text == value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   labelStyle: TextStyle(
//                     color: Colors.grey,
//                   ),
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (!passwordsMatch)
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 23, vertical: 5),
//             child: Text(
//               'Passwords do not match',
//               style: TextStyle(color: Colors.red),
//             ),
//           ),
//       ],
//     );
//   }
// }
