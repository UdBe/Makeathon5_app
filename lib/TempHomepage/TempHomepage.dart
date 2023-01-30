import 'package:flutter/material.dart';
import 'package:makeathon5_app/FirstPage/main.dart';
import 'package:makeathon5_app/TempHomepage/HomePageButton.dart';

class TempHomepage extends StatelessWidget {
  const TempHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: const Text(
                "This is a temporary placeholder HomePage made to help in development until the final HomePage is built",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            HomepageButton("SignIn", 1),
            HomepageButton("CheckIn", 2),
            HomepageButton("Annoucements", 3),
            HomepageButton("Timeline (Not Added)", 4),
          ],
        ),
      ),
    );
  }
}
