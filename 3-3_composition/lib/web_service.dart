import 'dart:convert';
import 'package:mvvm_flutter/models/movie.dart';
import 'package:mvvm_flutter/models/movie_details.dart';
import 'package:http/http.dart' as http;

class Webservice {

  Future<List<Movie>> fetchMovies(String keyword) async {

    String url = "http://www.omdbapi.com/?s=${keyword}&apikey=eb0d5538";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {

      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Movie.fromJson(movie)).toList();

    } else {
      throw Exception("Unable to perform request!");
    }
  }


  Future<MovieDetails> fetchMovieDetails(String imdbID) async {

    String url = "http://www.omdbapi.com/?i=${imdbID}&apikey=eb0d5538";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {

      final body = jsonDecode(response.body);
      final movieDetails = MovieDetails.fromJson(body);
      return movieDetails;

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}