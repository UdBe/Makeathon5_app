// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:makeathon5_app/HomePage/card_small.dart';
import 'package:makeathon5_app/HomePage/center_cards.dart';
import 'package:makeathon5_app/homepage/header_footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [CenterCards(), HeaderFooter()],
          ),
        ),
      ),
    );
  }
}
