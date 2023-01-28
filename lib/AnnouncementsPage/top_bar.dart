import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'Assets/vector2.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            Container(
              child: Image.asset(
                'Assets/vector7.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(
                  0, -MediaQuery.of(context).size.height / 8, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Announcements",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Jejugothic'),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 40, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.asset(
                  //   'Assets/back_arrow.png',
                  //   scale: 1.25,
                  // ),
                  Spacer(),
                  Image.asset(
                    'Assets/MLSClogo.png',
                    scale: 2.75,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
