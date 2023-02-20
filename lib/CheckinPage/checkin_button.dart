import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CheckinButton extends StatelessWidget {
  bool isEnabled = false;

  CheckinButton(bool isEnabled) {
    this.isEnabled = isEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled
          ? () {
              //checkinUser(context);
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 34, 99, 192),
      ),
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
          child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'Check In',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                ],
              )),
        ),
      ),
    );
  }
}
