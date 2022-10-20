import 'package:flutter/material.dart';
import 'package:mvvm_flutter/views/movies_list_view.dart';
import 'package:mvvm_flutter/viewmodels/movies_list_view_model.dart';
import 'package:provider/provider.dart';

import 'router.dart' as LocalRouter;
import 'constants.dart';


void main() => runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies MVVM Example",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        home:
        ChangeNotifierProvider(
          create: (context) => MovieListViewModel(),
          child: MovieListView(),
        ),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: listRoute,
    );
  }
}