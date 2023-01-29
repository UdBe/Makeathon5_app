import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:makeathon5_app/AnnouncementsPage/announcement.dart';
import 'package:makeathon5_app/AnnouncementsPage/announcement_card.dart';
import 'package:makeathon5_app/AnnouncementsPage/top_bar.dart';

import '../firebase_options.dart';

class AnnouncementsPage extends StatefulWidget {
  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPage();
}

class _AnnouncementsPage extends State<AnnouncementsPage> {
  var announcements = <Announcement>[];
  bool buffering = true;

  @override
  void initState() {
    super.initState();
    fetchAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopBar(),
          Visibility(
            visible: buffering,
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Row(
                    children: [Spacer(), CircularProgressIndicator(), Spacer()],
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5),
            child: ListView.builder(
              padding: EdgeInsets.all(15),
              itemBuilder: (context, position) {
                return AnnouncementCard(
                    announcements[announcements.length - position - 1]);
              },
              itemCount: announcements.length,
            ),
          )
        ],
      ),
    );
  }

  Future<void> fetchAnnouncements() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    DatabaseReference announcementsRef =
        FirebaseDatabase.instance.ref().child("Announcements");
    announcementsRef.onChildAdded.listen((event) {
      Announcement announcement = Announcement(
        formattedDateTime: event.snapshot.child("time").value.toString(),
        body: event.snapshot.child("body").value.toString(),
      );
      setState(
        () {
          announcements.add(announcement);
          buffering = false;
        },
      );
    });
  }
}
