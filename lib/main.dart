import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///D:/ValayProject/smart_app/smart_app/lib/CommonClass/bottombar.dart';
import 'file:///D:/ValayProject/smart_app/smart_app/lib/DataController/fetchdata.dart';

import 'MovieList/movielist.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      home:   ChangeNotifierProvider(
          builder: (_) => NewsArticleListViewModel(),
          child: BottomBarList()
      ),
     //  home: BottomBarList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

