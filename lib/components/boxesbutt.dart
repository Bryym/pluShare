import 'package:flutter/material.dart';

class GreetBox extends StatelessWidget {
  final Function()? onTap;
  final String name;
  const GreetBox({Key? key, this.onTap, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String name = "John Doe";
    double fontSize = 60.0 - (name.length * 2.0);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/gooday.png',
            ),
            Positioned(
              bottom: 28,
              left: 87,
              child: Text(
                name,
                style: TextStyle(
                  color: Color(0xFFFF5454),
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventBox extends StatelessWidget {
  final Function()? onTap;
  final String date;
  final String time;
  final String venue;
  final String fvenue;
  const EventBox({super.key, this.onTap, required this.date, required this.time, required this.venue, required this.fvenue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/eventboxbutt.png'),
            Positioned(
              top: 6,
              left: 17,
              child: Text(date,
              style: const TextStyle(
                color: Color(0xFFFF5454),
                fontWeight: FontWeight.bold,
              )),
            ),
            const Positioned(
              left: 32,
              top: 24,
              child: Text(
                'Time:',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 40,
              child: Text(
                'Venue:',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 24,
              left: 100,
              child: Text(
                time,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 100,
              child: Text(venue,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),),
            ),
            Positioned(
              top: 55,
              left: 100,
              child: Text(
                fvenue,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}

class BoxButtImage extends StatelessWidget {
  final Function()? onTap;
  final String imagePath;
  final double height;
  final double width;
  const BoxButtImage({super.key, this.onTap, required this.imagePath, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Image.asset(imagePath,
        height: height,
        width: width,),
      ),
    );
  }
}