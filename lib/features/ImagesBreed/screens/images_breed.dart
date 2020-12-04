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

  Color orange = DesignColors.orange();
  Color white = DesignColors.white();
  Color dark = DesignColors.dark();
  int listLimit = 10;
  bool load = false;

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
      backgroundColor: white,
      appBar: _appBar(size),
      body: Container(
        color: white,
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

            if(snapshot.data.length <= 10){
              listLimit = snapshot.data.length;
            }

            return Column(
              children: [
                Text(
                    'Só fofura por aqui 🥰',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: size.width * 0.02),
                Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scroll){
                        if(!load && scroll.metrics.pixels == scroll.metrics.maxScrollExtent){
                          _loadMore(snapshot.data);
                        }
                        return null;
                      },
                      child: ListView(
                        children: List.generate(
                                listLimit,
                                (index) =>
                                    ShowImage(
                                        image: snapshot.data[index]
                                    )
                        )..add(!load ? EndImage() : _loading()),
                      ),
                    )
                ),
              ],
            );

          },
        ),
      ),
    );
  }

  Widget _loading(){
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
          child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(orange)
          )
      ),
    );
  }

  Future _loadMore(List list) async {

    if(listLimit < list.length){
      setState(() => load = true);
      await Future.delayed(Duration(seconds: 2));
      if((listLimit + 10) > list.length){
        setState(() => listLimit = list.length);
      } else {
        setState(() => listLimit += 10);
      }
      setState(() => load = false);
    }

  }

  void refreshList() {
    this.setState(() {
      _fetchImagesBreeds = fetchImagesBreeds(widget.breed);
    });
  }

  Widget _appBar(Size size){
    return AppBar(
      backgroundColor: orange,
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
