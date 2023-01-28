import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'announcement.dart';

class AnnouncementCard extends StatelessWidget {
  Announcement? announcement;

  AnnouncementCard(this.announcement);
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 12,
        child: Card(
          margin: EdgeInsets.only(bottom: 20),
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: ListTile(
                title: Row(
                  children: [
                    Text(
                      '5:30 PM',
                      style: TextStyle(
                          fontFamily: 'Inter', fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '28 Jan',
                      style: TextStyle(
                          fontFamily: 'Inter', fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.left,
                  ),
                )),
          ),
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ));
  }
}
