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
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 8.0,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8),
            alignment: Alignment.center,
            child: SizedBox(
              height: 5,
              width: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          QrImage(
            data: "$TeamName",
            version: QrVersions.auto,
            size: 200.0,
          ),
          Spacer(),
        ],
      ),
    );
    ;
  }
}
