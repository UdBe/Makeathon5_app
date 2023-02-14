import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:makeathon5_app/HomePage/main.dart';
import 'FirstPage/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Something Went Wrong!"),
                );
              } else if (snapshot.hasData) {
                return HomePage();
              } else {
                return FirstPage();
              }
            }),
      ),
    );
  }
}
