import 'package:flutter/material.dart';

class EndImage extends StatelessWidget {

  final bool showText;

  EndImage({this.showText = true});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        top: size.width * 0.05,
        bottom: size.width * 0.05
      ),
      child: Column(
        children: [
          _image(size),
          if(showText)
            Text(
                'Que pena, \nacabou as fotos 😩',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold
              ),
            )
        ],
      ),
    );
  }

  Widget _image(Size size){
    return Image.asset(
      'assets/images/dog.png',
      color: Colors.black,
      height: size.width * 0.3,
    );
  }
}
