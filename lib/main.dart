import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:makeathon5_app/AnnouncementsPage/announcement_card.dart';
import 'package:makeathon5_app/AnnouncementsPage/main.dart';
import 'package:makeathon5_app/CheckinPage/main.dart';
import 'package:makeathon5_app/DemoHomePage/main.dart';
import 'FirstPage/main.dart';
import 'firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(const MyApp());
  initFirebase();
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Todo: Replace with the final Homepage
      home: HomePage(),
      
    );
  }
}
