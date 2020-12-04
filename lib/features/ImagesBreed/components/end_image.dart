import 'package:flutter/material.dart';
import 'package:iti_malia/features/Design/colors.dart';

class EndImage extends StatelessWidget {
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
