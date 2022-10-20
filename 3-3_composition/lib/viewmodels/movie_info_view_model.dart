import 'package:flutter/material.dart';
import 'package:mvvm_flutter/web_service.dart';
import 'package:mvvm_flutter/viewmodels/movie_details_view_model.dart';

class MovieInfoViewModel extends ChangeNotifier {

  MovieDetailsViewModel? movieDetails;

  Future<void> fetchMovieDetails(String imdbID) async {
    final results =  await Webservice().fetchMovieDetails(imdbID);
    movieDetails = MovieDetailsViewModel(movieDetails: results);
    notifyListeners();
  }

}