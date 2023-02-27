// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:makeathon5_app/AnnouncementsPage/main.dart';
import 'package:makeathon5_app/HomePage/ModalScreen.dart';
import 'package:makeathon5_app/HomePage/center_cards.dart';
import 'package:makeathon5_app/HomePage/header_footer.dart';
import 'package:makeathon5_app/TimelinePage/main.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

HelpScreen(context) {
  var sheetController = scaffoldKey.currentState!
      .showBottomSheet((context) => BottomHelpScreen());
  sheetController.closed.then((value) {
    print("closed");
  });
}

HelpScreen2(context) {
  return showBottomSheet(
      context: context,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BottomHelpScreen();
      });
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //'/Checkin': (context) => CheckinPage(),
        '/Announcements': (context) => AnnouncementsPage(),
        '/Timeline': (context) => TimelinePage()
      },
      home: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [CenterCards(), HeaderFooter()],
          ),
        ),
        floatingActionButton: Container(
          height: 85,
          width: 75,
          child: FloatingActionButton(
            heroTag: "Floatingbtn",
            backgroundColor: Color.fromRGBO(34, 99, 192, 1.000),
            onPressed: () async {
              HelpScreen(context);
            },
            child: const Icon(
              Icons.qr_code_rounded,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
