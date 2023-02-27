import 'package:flutter/material.dart';
import 'package:makeathon5_app/SharedPreferences.dart';
import 'package:qr_flutter/qr_flutter.dart';

String TeamName = 'Error';

class BottomHelpScreen extends StatefulWidget {
  @override
  State<BottomHelpScreen> createState() => _BottomHelpScreenState();
}

class _BottomHelpScreenState extends State<BottomHelpScreen> {
  loadTeamName() async {
    String teamname = await getTeamName() ?? "";
    TeamName = teamname;
    setState(() {});
    return TeamName;
  }

  @override
  void initState() {
    loadTeamName();
    Future.delayed(Duration(milliseconds: 1000), () {
      loadTeamName();
    });
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
      height: MediaQuery.of(context).size.height / 2.2,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 45,
                    top: MediaQuery.of(context).size.height / 75),
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          QrImage(
            data: "$TeamName",
            version: QrVersions.auto,
            size: 200.0,
          ),
        ],
      ),
    );
    ;
  }
}
