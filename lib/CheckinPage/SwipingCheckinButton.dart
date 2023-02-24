import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

import '../SharedPreferences.dart';
import 'Geofencing.dart';

class SwipingCheckInButton extends StatelessWidget {
  bool isEnabled = false;
  Function? callback;

  SwipingCheckInButton(this.isEnabled, this.callback);

  void onSwipe(context) {
    isEnabled
        ? () {
            checkinUser(context);
          }
        : null;
  }

  void checkinUser(context) async {
    showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    double distance = await geofenceUser(context);
    if (distance < 1000.00) {
      DocumentReference doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(await getUserID());
      doc.set({"Checkin": true}, SetOptions(merge: true));
      await setCheckedIn(true);
      callback!.call();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Check-In Successful!"),
        ),
      );
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text("Please reach the offline location before checking-in")));
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 18),
      child: SwipeButton.expand(
        height: MediaQuery.of(context).size.height / 15,
        thumb: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        child: Text(
          "Swipe to Check In",
          style: (TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
        ),
        enabled: isEnabled,
        activeThumbColor: Color.fromRGBO(24, 81, 164, 1.000),
        activeTrackColor: Color.fromRGBO(34, 99, 192, 0.850),
        onSwipe: isEnabled
            ? () {
                checkinUser(context);
              }
            : null,
      ),
    );
  }
}
