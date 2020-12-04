import 'package:flutter/material.dart';
import 'package:iti_malia/features/Design/colors.dart';

class Button {
  static defaultButton({
    String text,
    @required BuildContext context,
    Function onPressed,
    double elevation,
    double height,
    double fontSize,
    bool isLoading = false
  }){
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: height ?? 50,
        child: RaisedButton(
          disabledColor: DesignColors.orange().withOpacity(0.35),
          elevation: elevation ?? 5,
          splashColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: onPressed,
          color: DesignColors.orange(),
          child: !isLoading ?
          Text(text,
            style: TextStyle(
                fontSize: fontSize != null ? fontSize : 18,
                fontWeight: FontWeight.w400,
                color: Colors.white
            ),
          )
              :
          Center(child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)
          )),
        ),
      ),
    );
  }
}