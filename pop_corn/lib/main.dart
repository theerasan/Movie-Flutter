import 'package:flutter/material.dart';
import 'package:pop_corn/presentation/movie_list/movie.dart';
import 'package:pop_corn/presentation/movie_list/movie_list.dart';

import 'main_development.dart' as development;

void main() {
  development.main();
}

class PopcornApp extends StatelessWidget {
  const PopcornApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: MovieList(movies: [
          Movie(id: 1, title: "title_1"),
          Movie(id: 2, title: "title_2"),
          Movie(id: 3, title: "title_3"),
          Movie(id: 4, title: "title_4"),
          Movie(id: 5, title: "title_5"),
          Movie(id: 6, title: "title_6"),
          Movie(id: 7, title: "title_7"),
          Movie(id: 8, title: "title_8"),
          Movie(id: 9, title: "title_9"),
          Movie(id: 10, title: "title_10"),
        ]),
      ),
    );
  }
}