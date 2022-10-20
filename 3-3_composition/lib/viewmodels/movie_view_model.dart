import 'package:mvvm_flutter/models/movie.dart';

class MovieViewModel {

  final Movie movie;

  MovieViewModel({required this.movie});

  String get title {
    return this.movie.title;
  }

  String get poster {
    return this.movie.posterUrl;
  }

  String get imdbID {
    return this.movie.imdbID;
  }

}