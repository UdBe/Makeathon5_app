import 'package:flutter/material.dart';

//Firebase Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:makeathon5_app/AnnouncementsPage/announcement.dart';
import 'package:makeathon5_app/AnnouncementsPage/main.dart';
import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnnouncementsPage(),
    );
  }
}
