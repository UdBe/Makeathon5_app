// ignore_for_file: camel_case_types
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:makeathon5_app/HomePage/card_small.dart';
import 'package:makeathon5_app/SharedPreferences.dart';

import 'carousel_card.dart';

class CenterCards extends StatefulWidget {
  const CenterCards({super.key});

  @override
  State<CenterCards> createState() => CenterCardsState();
}

class CenterCardsState extends State<CenterCards> {
  bool? isCheckedIn;
  int _index = 0;
  int _indexj = 0;

  @override
  void initState() {
    getCheckedin().then((value) {
      setState(() {
        this.isCheckedIn = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 4.5)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 3.8,
            //   child: Center(
            //     child: PageView.builder(
            //       itemCount: 10,
            //       controller: PageController(viewportFraction: 0.95),
            //       onPageChanged: (int index) => setState(() => _index = index),
            //       itemBuilder: (_, i) {
            //         return Transform.scale(
            //           scale: i == _index ? 1 : 0.9,
            //           child: Container(
            //             padding: const EdgeInsets.symmetric(vertical: 5),
            //             child: Card(
            //               clipBehavior: Clip.antiAlias,
            //               elevation: 4,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(20)),
            //               child: InkWell(
            //                 splashFactory: InkRipple.splashFactory,
            //                 onTap: () {},
            //                 child: Center(
            //                     child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(20),
            //                   child: Image(
            //                       fit: BoxFit.fitHeight,
            //                       image: AssetImage("Assets/carousel1.png")),
            //                 )),
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 22,
            ),
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height / 4),
              items: [
                carouselCard(AssetImage("Assets/carousel1.png")),
                carouselCard(AssetImage("Assets/carousel1.png")),
                carouselCard(AssetImage("Assets/carousel1.png")),
                carouselCard(AssetImage("Assets/carousel1.png")),
                carouselCard(AssetImage("Assets/carousel1.png"))
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return i;
                  },
                );
              }).toList(),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: SmallCard(
                      title: 'Check In',
                      imgPath: "Assets/checkin.png",
                      subtitle: isCheckedIn == null
                          ? "Loading..."
                          : (isCheckedIn! ? "Successful" : "Not checked in"),
                      subtitleColor: isCheckedIn == null
                          ? Colors.grey
                          : (isCheckedIn!
                              ? Color.fromARGB(255, 48, 147, 98)
                              : Color.fromARGB(255, 184, 62, 62)),
                      route: '/Checkin',
                      callback: () async {
                        isCheckedIn = await getCheckedin();
                        setState(() {});
                      },
                    )),
                Flexible(
                    flex: 1,
                    child: SmallCard(
                      title: 'Timeline',
                      imgPath: "Assets/timeline.png",
                      subtitleColor: Color.fromARGB(255, 48, 147, 98),
                      route: '/Timeline',
                    )),
                Flexible(
                    flex: 1,
                    child: SmallCard(
                      imgPath: "Assets/announcements.png",
                      title: 'Announcements',
                      route: '/Announcements',
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
