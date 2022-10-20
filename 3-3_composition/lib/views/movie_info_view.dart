import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/movie_info_view_model.dart';
import 'package:mvvm_flutter/widgets/movies_list.dart';


import 'package:provider/provider.dart';

class MovieInfoView extends StatefulWidget {

  final String imdbID;

  MovieInfoView(this.imdbID);

  @override
  _MovieInfoViewState createState() => _MovieInfoViewState();
}

class _MovieInfoViewState extends State<MovieInfoView> {

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<MovieInfoViewModel>(context, listen: false).fetchMovieDetails(widget.imdbID);
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
  }

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<MovieInfoViewModel>(context);

    const fontSize = 16.0;

    return Scaffold(
        appBar: AppBar(
            title: Text(vm.movieDetails != null ? vm.movieDetails!.title : "Loading...")
        ),
        body:
        Column(
          children: [
            Container(
              height:50
        ),
        Table(

          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: Text("Rating:", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Text(vm.movieDetails != null ? vm.movieDetails!.rated : "", style: const TextStyle(fontSize: fontSize),),
                  ),
                ]
              ),
              TableRow(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("Actors:", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(vm.movieDetails != null ? vm.movieDetails!.actor : "", style: const TextStyle(fontSize: fontSize),),
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("Directors:", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(vm.movieDetails != null ? vm.movieDetails!.director : "", style: const TextStyle(fontSize: fontSize),),
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("Writers:", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(vm.movieDetails != null ? vm.movieDetails!.writer : "", style: const TextStyle(fontSize: fontSize),),
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("Plot:", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(vm.movieDetails != null ? vm.movieDetails!.plot : "", style: const TextStyle(fontSize: fontSize),),
                    ),
                  ]
              ),
            ],
        ),
        ]
        )

        //     Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const Text("Actors:"),
        //           Container(
        //             width:10
        //           ),
        //           Expanded (
        //               child: Text(vm.movieDetails != null ? vm.movieDetails!.actor : "", textAlign: TextAlign.left),
        //           )
        //         ]
        //     ),
        //     Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const Text("Writers:"),
        //           Container(
        //               width:10
        //           ),
        //           Expanded (
        //             child: Text(vm.movieDetails != null ? vm.movieDetails!.writer : "", textAlign: TextAlign.left),
        //           )
        //         ]
        //     ),
        //     Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const Text("Directors:"),
        //           Container(
        //               width:10
        //           ),
        //           Expanded (
        //             child: Text(vm.movieDetails != null ? vm.movieDetails!.director : "", textAlign: TextAlign.left),
        //           )
        //         ]
        //     ),
        //     Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const Text("Plot:"),
        //           Container(
        //               width:10
        //           ),
        //           Expanded (
        //             child: Text(vm.movieDetails != null ? vm.movieDetails!.plot : "", textAlign: TextAlign.left),
        //           )
        //         ]
        //     ),
        //   ],
        // )

    );
  }
}