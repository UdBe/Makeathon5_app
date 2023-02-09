import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  String? title, subtitle, status, imgPath;
  Color? subtitleColor;
  SmallCard({
    this.imgPath,
    this.title,
    this.subtitle,
    this.subtitleColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
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
          onTap: () {},
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
    );
  }
}
