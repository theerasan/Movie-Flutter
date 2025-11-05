import 'package:flutter/material.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_header.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_viewmodel.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:pop_corn/ui/core/theme/colors.dart';
import 'package:pop_corn/ui/genre_label.dart';
import 'package:pop_corn/ui/rate_label.dart';
import 'package:pop_corn/ui/release_date_label.dart';
import 'package:pop_corn/ui/vote_label.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.viewModel});
  final MovieDetailViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final lce = widget.viewModel.lceElement;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text('Movie Detail'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListenableBuilder(listenable: lce, builder: (context, _) {
        if (lce.loading && lce.result == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (lce.result != null) {
          final movie = lce.result as MovieDetail;
          return MovieDetailHeader(movie: movie);
        } else if (lce.error != null) {
          return Text("error");
        }
        return Text("error");
      }),
    );
  }

}