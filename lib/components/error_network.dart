import 'package:flutter/material.dart';
import 'package:iti_malia/features/Design/colors.dart';

import 'button.dart';

class ErrorNetwork {
  static Widget renderError(
      BuildContext context,
      Function function,
      Size size
  ) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Material(
            elevation: 5,
            shadowColor: Colors.white,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  _icon(size),
                  SizedBox(height: 20),
                  _title('Erro ao carregar dados.', size),
                  SizedBox(height: 20),
                  Text(
                      'Por favor, verifique sua conexão ou tente novamente',
                      textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size.width * 0.04),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: size.width * 0.05),
        Button.defaultButton(
            context: context,
            text: 'Tentar novamente',
            onPressed: () => function(),
        )
      ],
    );
  }

  static Widget _icon(Size size) {
    return Container(
        alignment: Alignment.center,
        child: Icon(
            Icons.wifi_off,
            size: size.width * 0.1,
            color: DesignColors.orange()
        )
    );
  }

  static Widget _title(String text, Size size) {

    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.04
        ),
      ),
    );
  }

}
