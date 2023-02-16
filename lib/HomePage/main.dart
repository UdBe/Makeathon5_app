// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:makeathon5_app/AnnouncementsPage/main.dart';
import 'package:makeathon5_app/CheckinPage/main.dart';
import 'package:makeathon5_app/HomePage/center_cards.dart';
import 'package:makeathon5_app/HomePage/header_footer.dart';
import 'package:makeathon5_app/TimelinePage/main.dart';

HelpScreen(context) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 400,
              child: const Text(
                textAlign: TextAlign.center,
                "Participants will be able to ask for mentors from here",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        );
      });
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Checkin': (context) => CheckinPage(),
        '/Announcements': (context) => AnnouncementsPage(),
        '/Timeline': (context) => TimelinePage()
      },
      home: Scaffold(
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
            onPressed: () {
              HelpScreen(context);
            },
            child: const Icon(
              Icons.notifications_active,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
