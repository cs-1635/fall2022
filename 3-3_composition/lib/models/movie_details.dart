class MovieDetails {

  final String title;
  final String posterUrl;
  final String imdbID;

  final String year;
  final String rated;
  final String director;
  final String writer;
  final String actor;
  final String plot;

  MovieDetails({required this.title, required this.posterUrl, required this.imdbID,
    required this.year, required this.rated, required this.director, required this.writer,
    required this.actor, required this.plot});

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
        title: json["Title"],
        posterUrl: json["Poster"],
        imdbID: json["imdbID"],
        year: json["Year"],
        rated: json["Rated"],
        director: json["Director"],
        writer: json["Writer"],
        actor: json["Actors"],
        plot: json["Plot"],
    );
  }

}



