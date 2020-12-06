import 'package:flutter/material.dart';
import 'package:iti_malia/features/Design/colors.dart';

import 'home_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color orange = DesignColors.orange();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(size),
      body: HomeScreen(),
    );
  }

  Widget _appBar(Size size){
    return AppBar(
        backgroundColor: orange,
        elevation: 0.0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          width: size.width * 0.38,
          color: Colors.white,
        ),
    );
  }

}
