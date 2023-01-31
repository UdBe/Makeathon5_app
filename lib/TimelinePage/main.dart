import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:makeathon5_app/TimelinePage/timeline.dart';
import 'package:makeathon5_app/TimelinePage/top_bar.dart';
import '../firebase_options.dart';
import 'expandable_card.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  var timelines = <Timeline>[];
  bool isLoading = true;
  void initState() {
    super.initState();
    fetchTimelines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TopBar(),
            Container(
              margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height / 3) + 25),
              child: Row(
                children: [
                  Spacer(),
                  Flexible(
                    flex: 12,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ExpandableCard(timelines[index]);
                      },
                      itemCount: timelines.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              child: Column(children: [
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    Visibility(
                      visible: isLoading,
                      child: CircularProgressIndicator(),
                    ),
                    Spacer()
                  ],
                ),
                Spacer()
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future<void> fetchTimelines() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    DatabaseReference timelineRef =
        FirebaseDatabase.instance.ref().child('Timelines');
    final snapshot = await timelineRef.get();
    for (var timelineSnapshot in snapshot.children) {
      Timeline timeline = Timeline(
        title: timelineSnapshot.child('title').value.toString(),
        body: timelineSnapshot.child('body').value.toString(),
        duration: timelineSnapshot.child('duration').value.toString(),
        formattedDateTime: timelineSnapshot.child('startTime').value.toString(),
      );
      timelines.add(timeline);
    }
    setState(() {
      isLoading = false;
    });
  }
}
