import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeathon5_app/CheckinPage/checkin_button.dart';
import 'package:makeathon5_app/CheckinPage/upload_button.dart';

class CheckinPage extends StatefulWidget {
  User? user;

  @override
  _CheckinPageState createState() => _CheckinPageState();
}

void checkinUser() {
  File certificate = UploadButton.file!;
  //TODO: Implement checkin and upload cert to databse
}

//test
class _CheckinPageState extends State<CheckinPage> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'Assets/vector2.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.75,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Container(
                child: Image.asset(
                  'Assets/vector7.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Check In",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Jejugothic'),
                  ),
                  Spacer(),
                  Container(
                    transform: Matrix4.translationValues(
                        0, -MediaQuery.of(context).size.height / 20, 0),
                    child: Image.asset('Assets/vector.png'),
                  ),
                ],
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
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            child: Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    Checkbox(
                        value: ischecked,
                        onChanged: (bool? value) {
                          setState(() {
                            ischecked = value!;
                          });
                          ;
                        }),
                    Flexible(
                      child: Text(
                        "Me tumhari saari shartein maanta/maanti hu",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                CheckinButton(ischecked)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
