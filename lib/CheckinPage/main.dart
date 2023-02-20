import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeathon5_app/CheckinPage/Geofencing.dart';
import 'package:makeathon5_app/CheckinPage/SwipingCheckinButton.dart';
import '../SharedPreferences.dart';

class CheckinPage extends StatefulWidget {
  User? user;

  @override
  _CheckinPageState createState() => _CheckinPageState();
}

void checkinUser(context) async {
  double distance = await geofenceUser(context);
  if (distance < 1000.00) {
    DocumentReference doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(await getUserID());
    doc.set({"Checkin": true}, SetOptions(merge: true));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Check-In Successful!"),),);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please reach the offline location before checking-in")));
  }
}

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
                SwipingCheckInButton(ischecked)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
