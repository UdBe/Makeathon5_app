// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:makeathon5_app/TimelinePage/timeline.dart';

class ExpandableCard extends StatelessWidget {
  Timeline? timeline;
  ExpandableCard(this.timeline);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      margin: EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        child:
            // ignore: prefer_const_literals_to_create_immutables

            ExpansionTile(
          trailing: Icon(
            Icons.arrow_drop_down_rounded,
          ),
          title: Text(
            '${timeline!.title}',
            style: TextStyle(
              color: Color.fromARGB(255, 34, 99, 192),
              fontSize: 22,
              fontFamily: 'Jejugothic',
              // fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            '${timeline!.time}',
            style: TextStyle(
              fontFamily: 'Jejugothic',
              color: Color.fromARGB(255, 34, 99, 192),
              fontSize: 12,
              // fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            ListTile(
              visualDensity: VisualDensity(vertical: 4),
              subtitle: Text(
                '${timeline!.body}',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
