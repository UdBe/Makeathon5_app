// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ExpandableCards extends StatefulWidget {
  @override
  State createState() {
    return ExpandableCardsState();
  }
}

class ExpandableCardsState extends State<ExpandableCards> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ExpansionTile(
                trailing: Icon(
                  Icons.arrow_drop_down,
                ),
                title: Text(
                  'Checkpoint 1',
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 99, 192),
                    fontSize: 25,
                    fontFamily: 'Jejugothic',
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '9:00AM-12:00PM',
                  style: TextStyle(
                    fontFamily: 'Jejugothic',
                    color: Color.fromARGB(255, 34, 99, 192),
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  ListTile(
                    visualDensity: VisualDensity(vertical: 4),
                    title: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
