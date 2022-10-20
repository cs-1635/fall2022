import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/movie_info_view_model.dart';
import 'package:mvvm_flutter/views/movies_list_view.dart';
import 'package:mvvm_flutter/views/movie_info_view.dart';
import 'package:mvvm_flutter/viewmodels/movies_list_view_model.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case listRoute:
        return MaterialPageRoute(builder: (_) =>
            ChangeNotifierProvider(
              create: (context) => MovieListViewModel(),
              child: MovieListView(),
            )
        );
      case detailsRoute:
        var imdbID = settings.arguments as String;
        return MaterialPageRoute(builder: (_) =>
            //Feed(imdbID));
              ChangeNotifierProvider(
                create: (context) => MovieInfoViewModel(),
                child: MovieInfoView(imdbID),
              )
            );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}