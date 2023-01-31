import 'package:flutter/material.dart';
import 'package:makeathon5_app/AnnouncementsPage/main.dart';
import 'package:makeathon5_app/CheckinPage/main.dart';
import 'package:makeathon5_app/FirstPage/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(
              color: Color(0xFF2263C0),
              width: 2,
            )
        ),
        backgroundColor: Color(0xFF2263C0),
        title: Center(
          child: Text(
            'Demo Home Page',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'JejuGothic',
              fontSize: 30,
            ),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              elevatedButtonCustom('Announcements Page', () {
                Navigator.of(context).push(
                  new MaterialPageRoute(builder: (BuildContext context) => AnnouncementsPage() ));
              }),
              SizedBox(height: 30,),
              elevatedButtonCustom('Check-in Page', () {
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (BuildContext context) => CheckinPage() ));
              }),
              SizedBox(height: 30,),
              elevatedButtonCustom('First Page', ()  {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context) => FirstPage() ));
              }),
          ],
        ),
      ),
    );
  }
}

Widget elevatedButtonCustom(String value , Function? function())
{
    return  ElevatedButton(
        onPressed: function,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
              value,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'JejuGothic',
                fontSize: 30,
              ),
          ),
        ),
        style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2263C0),
      ),
    );
}

