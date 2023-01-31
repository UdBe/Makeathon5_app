import 'package:flutter/material.dart';
import 'package:makeathon5_app/AnnouncementsPage/main.dart';
import 'package:makeathon5_app/CheckinPage/main.dart';
import 'package:makeathon5_app/FirstPage/main.dart';

class HomepageButton extends StatelessWidget {
  String ButtonText;
  int ScreenNumber;
  HomepageButton(this.ButtonText, this.ScreenNumber);

  NextScreenFunc(int screenNumber, BuildContext context) {
    switch (screenNumber) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FirstPage()),
        );
        break;

      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckinPage()),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnnouncementsPage()),
        );
        break;

      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckinPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
      child: ElevatedButton(
        onPressed: () {
          NextScreenFunc(ScreenNumber, context);
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(440, 40),
        ),
        child: Text(ButtonText),
      ),
    );
  }
}
