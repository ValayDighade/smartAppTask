import 'package:flutter/material.dart';
import 'file:///D:/ValayProject/smart_app/smart_app/lib/MovieDes/moviedescription.dart';
import 'file:///D:/ValayProject/smart_app/smart_app/lib/TopMovieList/topratedmovie.dart';

import '../MovieList/movielist.dart';

class BottomBarList extends StatefulWidget {
  @override
  _BottomBarListState createState() => _BottomBarListState();
}

class _BottomBarListState extends State<BottomBarList> {
  int bottomSelectedIndex = 0;
  int _selectedIndex = 0;


  List<Widget> _widgetOptions = <Widget>[
   // FirstPage(),
    MovieList(),
    TopRatedMovie(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(),
      bottomNavigationBar: bottomBar(),
      body:_widgetOptions.elementAt(_selectedIndex),
    );
  }

  bottomBar() {
    return BottomNavigationBar(

      backgroundColor: Colors.orangeAccent,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          title: Text('Now Playing'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text('Top Rated'),
        ),
      ],
     onTap: _onItemTapped,
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
