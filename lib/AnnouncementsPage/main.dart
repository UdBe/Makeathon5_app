import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeathon5_app/AnnouncementsPage/announcement.dart';
import 'package:makeathon5_app/AnnouncementsPage/announcement_card.dart';
import 'package:makeathon5_app/AnnouncementsPage/top_bar.dart';

class AnnouncementsPage extends StatefulWidget {
  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPage();
}

class _AnnouncementsPage extends State<AnnouncementsPage> {
  var announcements = <Announcement>[];

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
          ListView.builder(itemBuilder: (context, position) {
            return AnnouncementCard(announcements[position]);
          })
        ],
      ),
    );
  }

  void fetchAnnouncements() {}
}
