// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:makeathon5_app/HomePage/card_small.dart';

class CenterCards extends StatefulWidget {
  const CenterCards({super.key});

  @override
  State<CenterCards> createState() => CenterCardsState();
}

class CenterCardsState extends State<CenterCards> {
  int _index = 0;
  int _indexj = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 4.5)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: PageView.builder(
                  itemCount: 10,
                  controller: PageController(viewportFraction: 0.95),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == _index ? 1 : 0.9,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            onTap: () {},
                            child: Center(
                              child: Text(
                                "Card ${i + 1}",
                                style: TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: SmallCard(
                      title: 'Check In',
                      imgPath: "Assets/checkin.png",
                      subtitle: "Not checked in",
                      subtitleColor: Color.fromARGB(255, 184, 62, 62),
                    )),
                Flexible(
                    flex: 1,
                    child: SmallCard(
                        title: 'Timeline',
                        imgPath: "Assets/timeline.png",
                        subtitle: "Checkpoint 3",
                        subtitleColor: Color.fromARGB(255, 48, 147, 98))),
                Flexible(
                    flex: 1,
                    child: SmallCard(
                      imgPath: "Assets/announcements.png",
                      title: 'Announce\nments',
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
