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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 20,
                    top: MediaQuery.of(context).size.height / 30),
                child: Image.asset(
                  'Assets/MLSClogo.png',
                ),
              ),
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
                  transform: Matrix4.translationValues(
                      0, -MediaQuery.of(context).size.height / 10, 0),
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'Assets/vector.png',
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Welcome to Makeathon5!',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, left: 8),
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Use your Devfolio Email ID to sign into the app',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SignInButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
