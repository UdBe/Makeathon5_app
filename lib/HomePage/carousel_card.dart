import 'package:flutter/material.dart';

class carouselCard extends StatelessWidget {
  var img1 = AssetImage("assetName");

  carouselCard(AssetImage img1) {
    this.img1 = img1;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          
          margin: EdgeInsets.all(MediaQuery.of(context).size.width / 75),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(fit: BoxFit.fitHeight, image: img1),
          ),
        ),
      ),
    );
  }
}
