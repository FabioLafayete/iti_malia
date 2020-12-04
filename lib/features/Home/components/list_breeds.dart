import 'package:flutter/material.dart';
import 'package:iti_malia/features/Design/colors.dart';
import 'package:iti_malia/features/ImagesBreed/screens/images_breed.dart';

class ListBreeds extends StatelessWidget {

  final String breed;

  ListBreeds({this.breed});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    Color orange = DesignColors.orange();

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ImagesBreed(breed: breed))
        );
      },
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(size.width * 0.05),
        margin: EdgeInsets.only(
            top: size.width * 0.02,
            bottom: size.width * 0.02
        ),
        decoration: BoxDecoration(
            color: orange.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: Colors.white,
                width: 0.3
            )
        ),
        child: Text(
            '${breed[0].toUpperCase()}${breed.substring(1)}',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
            )
        ),
      ),
    );
  }
}
