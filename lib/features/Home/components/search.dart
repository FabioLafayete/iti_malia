import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iti_malia/features/Design/colors.dart';
import 'package:iti_malia/features/Home/bloc/bloc_search.dart';

class SearchBreeds extends StatefulWidget {

  @override
  _SearchBreedsState createState() => _SearchBreedsState();
}

class _SearchBreedsState extends State<SearchBreeds> {

  Color blue = DesignColors.blue();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<SearchBloc>(context);

    return Container(
      decoration: BoxDecoration(
          color: DesignColors.darkBlue(),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(
              color: Colors.white,
              width: 0.3
          )
      ),
      margin: EdgeInsets.only(bottom: size.width * 0.02),
      padding: EdgeInsets.all(size.width * 0.03),
      width: size.width,
      height: size.width * 0.12,
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        decoration: InputDecoration(
          hintText: 'Procurar raça...',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
          contentPadding: EdgeInsets.only(top: size.width * 0.1),
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: size.width * 0.07,
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: (text) => bloc.inSearch.add(text),
      ),
    );
  }
}
