class Movie {

  final String title;
  final String posterUrl;
  final String imdbID;

  Movie({required this.title, required this.posterUrl, required this.imdbID});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["Title"],
        posterUrl: json["Poster"],
        imdbID: json["imdbID"],
    );
  }

}