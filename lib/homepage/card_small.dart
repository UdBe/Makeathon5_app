import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  String? title, subtitle, status, imgPath;
  SmallCard({this.imgPath, this.title, this.subtitle, this.status});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width / 3,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 4,
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/Background.png", height: 30),
              SizedBox(height: 10),
              Text(
                "TimeLine",
                style: TextStyle(
                  fontFamily: 'JejuGothic',
                  fontWeight: FontWeight.w200,
                  fontSize: 18,
                  color: Color.fromARGB(255, 34, 100, 192),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
