import 'package:flutter/material.dart';
import 'package:iti_malia/features/Design/colors.dart';

class EndImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [_image(size)],
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

  Widget _shadow(Size size) {
    Color dark = DesignColors.dark();
    return Container(
      height: size.width * 0.3,
      decoration: BoxDecoration(
        color: dark,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(0.6),
            Colors.white.withOpacity(0.9),
          ],
          stops: [0.0, 0.4, 0.9],
        ),
      ),
    );
  }

}
