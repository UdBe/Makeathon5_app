import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:makeathon5_app/CheckinPage/main.dart';
import 'FirstPage/main.dart';
import 'TimelinePage/expandable_cards.dart';
import 'TimelinePage/main.dart';
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
      //TODO: change this to firstpage
      home: TimelinePage(),
    );
  }
}
