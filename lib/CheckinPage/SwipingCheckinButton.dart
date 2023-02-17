import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:makeathon5_app/CheckinPage/main.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';

class SwipingCheckInButton extends StatelessWidget {
  bool isEnabled = false;

  SwipingCheckInButton(bool isEnabled) {
    this.isEnabled = isEnabled;
  }

  void onSwipe(context) {
    isEnabled
        ? () {
            checkinUser(context);
          }
        : null;
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
