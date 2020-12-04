import 'package:flutter/material.dart';
import 'package:iti_malia/components/error_network.dart';
import 'package:iti_malia/features/Design/colors.dart';
import 'package:iti_malia/features/ImagesBreed/components/end_image.dart';
import 'package:iti_malia/features/ImagesBreed/components/show_images.dart';
import 'package:iti_malia/features/ImagesBreed/repository/images_breed.dart';

class ImagesBreed extends StatefulWidget {

  final String breed;

  ImagesBreed({this.breed});

  @override
  _ImagesBreedState createState() => _ImagesBreedState();
}

class _ImagesBreedState extends State<ImagesBreed> {

  Color darkBlue = DesignColors.darkBlue();
  Color dark = DesignColors.dark();

  Future<List<dynamic>> _fetchImagesBreeds;

  @override
  void initState() {
    super.initState();
    this._fetchImagesBreeds = fetchImagesBreeds(widget.breed);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: darkBlue,
      appBar: _appBar(size),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [dark, darkBlue, dark],
          ),
        ),
        padding: EdgeInsets.all(size.width * 0.05),
        child: FutureBuilder(
          future: this._fetchImagesBreeds,
          builder: (_, AsyncSnapshot<List<dynamic>>snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if(snapshot.hasError){
              return Center(
                child: ErrorNetwork.renderError(
                    context,
                    refreshList,
                    size
                ),
              );
            }
            
            return Column(
              children: [
                Text(
                    'Imagens Fofaaaas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: size.width * 0.06),
                Expanded(
                    child: ListView(
                      children: List.generate(
                              10,
                              (index) =>
                                  ShowImage(
                                      image: snapshot.data[index]
                                  )
                      )..add(Container()),
                    )
                ),
              ],
            );
            
          },
        ),
      ),
    );
  }

  void refreshList() {
    this.setState(() {
      _fetchImagesBreeds = fetchImagesBreeds(widget.breed);
    });
  }

  Widget _appBar(Size size){
    return AppBar(
      backgroundColor: darkBlue,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
          '${widget.breed[0].toUpperCase()}${widget.breed.substring(1)}',
          style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.06,
              fontWeight: FontWeight.bold
          )
      )
    );
  }

}
