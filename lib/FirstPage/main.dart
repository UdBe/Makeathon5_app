import 'package:flutter/material.dart';

import 'google_sign_in.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 99, 192),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
                  child: Image.asset(
                    'Assets/MLSClogo.png',
                  ),
                )
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'Assets/vector3.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.8,
                  fit: BoxFit.fill,
                ),
                Container(
                  transform: Matrix4.translationValues(0, -60, 0),
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'Assets/Vector.png',
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(30, -30, 0),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Lorem Ipsem',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  transform: Matrix4.translationValues(30, -30, 0),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                SignInButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
