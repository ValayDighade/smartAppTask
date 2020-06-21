import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'file:///D:/ValayProject/smart_app/smart_app/lib/ModelClass/moviemodel.dart';


String key='a07e22bc18f5cb106bfe4cc1f83ad8ed';
String url='https://api.themoviedb.org/3/movie/now_playing?api_key=$key';
String topRatedMovie='https://api.themoviedb.org/3/movie/top_rated?api_key=$key';
String imagePath='https://image.tmdb.org/t/p/original';



class MovieListViewModel extends ChangeNotifier {
  notifyListeners();
  List<MovieList> searchResult = [];
  List<MovieList> userDetails = [];

  Future<MovieList> getMovieList() async {

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    notifyListeners();
    for (Map user in jsonResponse['results']) {
      userDetails.add(MovieList.fromJson(user));
      notifyListeners();
    }
    notifyListeners();
  }

  Future<MovieList> getTopRatedMovie() async {

    final response = await http.get(topRatedMovie);
    var jsonResponse = convert.jsonDecode(response.body);
    notifyListeners();
    for (Map user in jsonResponse['results']) {
      userDetails.add(MovieList.fromJson(user));
      notifyListeners();
    }
    notifyListeners();
  }



}

