
class MovieList {

  final String title;
  final String overview;
  final String posterpath;
  final String date;
  final String popularity;

  MovieList({
    this.title, this.overview, this.posterpath, this.date, this.popularity
  });

  factory MovieList.fromJson(Map<String, dynamic> json)
  {
    return MovieList(
      title: json['title'],
      overview: json['overview'],
      posterpath: json['poster_path'],
      date: json['release_date'].toString(),
      popularity: json['popularity'].toString(),

    );
  }
}

class TopMovieList {

  final String title;
  final String overview;
  final String posterpath;
  final String date;
  final String popularity;

  TopMovieList({
    this.title, this.overview, this.posterpath, this.date, this.popularity
  });

  factory TopMovieList.fromJson(Map<String, dynamic> json)
  {
    return TopMovieList(
      title: json['title'],
      overview: json['overview'],
      posterpath: json['poster_path'],
      date: json['release_date'].toString(),
      popularity: json['popularity'].toString(),

    );
  }
}