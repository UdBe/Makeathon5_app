// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  int _indexj = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(216, 255, 254, 254),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 0.5 * MediaQuery.of(context).size.height,
                child: Center(
                  child: PageView.builder(
                    itemCount: 10,
                    controller: PageController(viewportFraction: 0.9),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          margin: EdgeInsets.only(
                            left: 17 * MediaQuery.of(context).size.width / 400,
                            top: 350 * MediaQuery.of(context).size.width / 800,
                            bottom:
                                40 * MediaQuery.of(context).size.width / 800,
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Card ${i + 1}",
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.only(left: 17, top: 50),
                  height: 135,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 126,
                        margin: EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: (() {}),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "images/Check.png",
                                  height: 55,
                                  width: 55,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Check-In",
                                  style: TextStyle(
                                    fontFamily: 'JejuGothic',
                                    fontWeight: FontWeight.w200,
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 34, 100, 192),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 126,
                        margin: EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: (() {}),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "images/timeline2.png",
                                  height: 50,
                                  width: 60,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "TimeLine",
                                  style: TextStyle(
                                    fontFamily: 'JejuGothic',
                                    fontWeight: FontWeight.w200,
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 34, 100, 192),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 126,
                        margin: EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: (() {}),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "images/Background.png",
                                  height: 55,
                                  width: 60,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "TimeLine",
                                  style: TextStyle(
                                    fontFamily: 'JejuGothic',
                                    fontWeight: FontWeight.w200,
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 34, 100, 192),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 126,
                        margin: EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: (() {}),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.bike_scooter,
                                  size: 50,
                                  color: Colors.red,
                                ),
                                SizedBox(height: 10),
                                Text("Scooter"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 126,
                        margin: EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: (() {}),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.bike_scooter,
                                  size: 50,
                                  color: Colors.red,
                                ),
                                SizedBox(height: 10),
                                Text("Scooter"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
