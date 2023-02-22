import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'announcement.dart';

class AnnouncementCard extends StatelessWidget {
  Announcement? announcement;

  AnnouncementCard(this.announcement);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Material(
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          splashColor: Color.fromARGB(66, 128, 128, 128),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    announcement!.time!,
                    style: TextStyle(
                        fontFamily: 'Inter', fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    announcement!.date!,
                    style: TextStyle(
                        fontFamily: 'Inter', fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  announcement!.body!,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
