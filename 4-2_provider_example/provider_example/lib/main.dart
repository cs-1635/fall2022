import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/movie_view_model.dart';

import 'view/home_view.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieViewModel>(
    child: const MyApp(),
    create: (_) => MovieViewModel(), // Create a new ChangeNotifier object
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Movie Example',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeView(),
    );
  }
}