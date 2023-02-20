import 'package:flutter/material.dart';
import 'package:makeathon5_app/SharedPreferences.dart';
import 'package:qr_flutter/qr_flutter.dart';

String TeamName = 'Error';

loadTeamName() async {
  String temp = await getTeamName();
  TeamName = temp;
}

class BottomHelpScreen extends StatefulWidget {
  @override
  State<BottomHelpScreen> createState() => _BottomHelpScreenState();
}

class _BottomHelpScreenState extends State<BottomHelpScreen> {
  @override
  void initState() {
    loadTeamName();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          height: 400,
          child: Column(
            children: [
              QrImage(
                data: "$TeamName",
                version: QrVersions.auto,
                size: 200.0,
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
