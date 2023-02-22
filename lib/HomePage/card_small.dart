import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:makeathon5_app/CheckinPage/main.dart';
import 'package:makeathon5_app/SharedPreferences.dart';

class SmallCard extends StatelessWidget {
  String? title, subtitle, status, imgPath;
  Color? subtitleColor;
  String route;
  Function? callback;

  SmallCard({
    required this.imgPath,
    required this.title,
    this.subtitle,
    this.subtitleColor,
    required this.route,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5.6,
      padding: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width / 3,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        elevation: 4,
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          onTap: () async {
            if (route == "/Checkin") {
              (await getCheckedin() == null)
                  ? (Fluttertoast.showToast(msg: "Some error ocurred"))
                  : ((await getCheckedin())!
                      ? (Fluttertoast.showToast(
                          msg: "You are already checked in!"))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CheckinPage(callback);
                            },
                          ),
                        ));
            } else {
              Navigator.pushNamed(context, route);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  imgPath!,
                  height: 35,
                  colorBlendMode: BlendMode.srcATop,
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      title!,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'JejuGothic',
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        color: Color.fromARGB(255, 34, 100, 192),
                      ),
                    ),
                    SizedBox(height: 5),
                    subtitle == null
                        ? SizedBox(
                            height: 0,
                          )
                        : Text(
                            subtitle!,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'JejuGothic',
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                              color: subtitleColor!,
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
