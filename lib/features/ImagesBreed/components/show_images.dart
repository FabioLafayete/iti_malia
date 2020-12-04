import 'package:flutter/material.dart';
import 'package:iti_malia/components/image_detail.dart';
import 'package:iti_malia/features/Design/colors.dart';

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
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>DetailImage(image: image))
          );
        },
        child: _image(size),
      )
    );
  }

  Widget _image(Size size){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width,
          height: size.width * 0.6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: DesignColors.orange(),
                  width: 2
              )
          ),
          child: Center(
            child: Icon(
              Icons.pets,
              color: DesignColors.orange(),
              size: size.width * 0.25,
            ),
          ),
        ),
        Image.network(
          image,
          width: size.width * 0.9,
          height: size.width * 0.5,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
