import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:iti_malia/components/error_network.dart';
import 'package:iti_malia/features/Design/colors.dart';
import 'package:iti_malia/features/Home/bloc/bloc_search.dart';
import 'package:iti_malia/features/Home/components/list_breeds.dart';
import 'package:iti_malia/features/Home/components/search.dart';
import 'package:iti_malia/features/Home/repository/breeds.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Color darkBlue = DesignColors.darkBlue();
  Color dark = DesignColors.dark();

  Future<List<String>> _fetchBreeds;

  @override
  void initState() {
    super.initState();
    this._fetchBreeds = fetchBreeds();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final bloc = BlocProvider.of<SearchBloc>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [dark, darkBlue, dark],
        ),
      ),
      padding: EdgeInsets.all(size.width * 0.05),
      child:  FutureBuilder(
        future: this._fetchBreeds,
        builder: (context, AsyncSnapshot<List<String>>snapshot){

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
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                  'Escolha uma raça',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold
                  )
              ),
              SizedBox(height: size.width * 0.06),
              SearchBreeds(),
              StreamBuilder(
                stream: bloc.outSearch,
                initialData: '',
                builder: (_, snap){

                  List<String> result = snapshot.data.where(
                          (value) => value.contains(snap.data)
                  ).toList();

                  return Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(
                              result.length,
                              (index) => ListBreeds(
                                breed: result[index],
                              )
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }

  void refreshList() {
    this.setState(() {
      _fetchBreeds = fetchBreeds();
    });
  }
}
