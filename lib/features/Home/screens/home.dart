import 'package:flutter/material.dart';
import 'package:iti_malia/features/Design/colors.dart';

import 'home_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController _pageController;
  int page = 0;

  Color darkBlue = DesignColors.darkBlue();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: darkBlue,
      appBar: _appBar(size),
      body: PageView(
        onPageChanged: (p) => setState(() => page = p),
        controller: _pageController,
        children: [
          HomeScreen(),
          Container(color: Colors.red),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
            iconSize: size.width * 0.08,
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            backgroundColor: darkBlue,
            showSelectedLabels: false,
            showUnselectedLabels: false,

            currentIndex: page,
            onTap: (p){
              _pageController.animateToPage(
                  p,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease
              );
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.pets_rounded), label: 'Aleatório'),
            ]
        )
    );
  }

  Widget _appBar(Size size){
    return AppBar(
        backgroundColor: darkBlue,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Iti Malia',
          style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.05
          ),
        ),
      actions: [
        if(page == 0)
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: (){}
            )
      ],
    );
  }

}
