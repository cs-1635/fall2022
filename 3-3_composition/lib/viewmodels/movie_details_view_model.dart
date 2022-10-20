import 'package:mvvm_flutter/models/movie_details.dart';

class MovieDetailsViewModel {

  final MovieDetails movieDetails;

  MovieDetailsViewModel({required this.movieDetails});

  String get title {
    return this.movieDetails.title;
  }

  String get poster {
    return this.movieDetails.posterUrl;
  }

  String get imdbID {
    return this.movieDetails.imdbID;
  }

  String get writer {
    return this.movieDetails.writer;
  }

  String get actor {
    return this.movieDetails.actor;
  }

  String get rated {
    return this.movieDetails.rated;
  }

  String get director {
    return this.movieDetails.director;
  }

  String get plot {
    return this.movieDetails.plot;
  }

}