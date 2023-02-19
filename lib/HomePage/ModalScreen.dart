import 'package:flutter/material.dart';

class BottomHelpScreen extends StatefulWidget {
  @override
  State<BottomHelpScreen> createState() => _BottomHelpScreenState();
}

class _BottomHelpScreenState extends State<BottomHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          height: 400,
          child: Text(
            textAlign: TextAlign.center,
            "Participants will be able to ask for mentors from here ",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
    ;
  }
}
