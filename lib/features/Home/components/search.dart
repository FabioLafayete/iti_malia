import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_malia/features/Design/colors.dart';
import 'package:iti_malia/features/Home/bloc/bloc_search.dart';

class SearchBreeds extends StatefulWidget {

  @override
  _SearchBreedsState createState() => _SearchBreedsState();
}

class _SearchBreedsState extends State<SearchBreeds> {

  Color blue = DesignColors.blue();
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<SearchBloc>(context);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(
              color: Colors.black,
              width: 0.3
          )
      ),
      margin: EdgeInsets.only(bottom: size.width * 0.02),
      padding: EdgeInsets.all(size.width * 0.028),
      width: size.width,
      height: size.width * 0.12,
      child: TextField(
        controller: _controller,
        style: GoogleFonts.coiny(color: Colors.black.withOpacity(0.9)),
        cursorColor: Colors.black,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        decoration: InputDecoration(
          hintText: 'Procurar raça...',
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
          contentPadding: EdgeInsets.only(top: size.width * 0.1),
          icon: Icon(
            Icons.search,
            color: DesignColors.orange(),
            size: size.width * 0.07,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _controller.clear();
              bloc.inSearch.add('');
              FocusScope.of(context).unfocus();
            },
            padding: EdgeInsets.only(bottom: size.width * 0.1),
            icon: Icon(
              Icons.clear,
              color: DesignColors.orange(),
              size: size.width * 0.07
            ),
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: (text) => bloc.inSearch.add(text.toLowerCase().trim()),
      ),
    );
  }
}
