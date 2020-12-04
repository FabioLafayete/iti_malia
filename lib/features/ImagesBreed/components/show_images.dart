import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {

  final String image;

  ShowImage({this.image});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
          top: size.width * 0.01,
          bottom: size.width * 0.01
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/background_image.png',
            width: size.width,
            height: size.width * 0.7,
            color: Colors.white.withOpacity(0.8),
            fit: BoxFit.fill,
          ),
          Container(
            margin: EdgeInsets.only(top: size.width * 0.06),
            child: Image.network(
              image,
              width: size.width * 0.8,
              height: size.width * 0.5,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
