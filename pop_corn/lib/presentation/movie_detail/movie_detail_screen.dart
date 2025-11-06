import 'package:flutter/material.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_body.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_cast.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_header.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_viewmodel.dart';
import 'package:pop_corn/ui/core/theme/colors.dart';
import 'package:pop_corn/ui/lce_element.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.viewModel, required this.id});
  final MovieDetailViewModel viewModel;
  final int id;

  @override
  State<StatefulWidget> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.setId = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    final lce = widget.viewModel.lceElement;
    final width = MediaQuery.of(context).size.width;
    var column = 1;
    if (width > 600 ) {
      column = 2;
    }
    return ListenableBuilder(listenable: lce, builder: (context, _) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          title: (lce.result != null && column == 1) ? Text(lce.result!.title) : SizedBox
              .shrink(),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: (lce.result != null) ? [
            IconButton(
              onPressed: () {
                widget.viewModel.onClickFavorite(lce.result);
              },
              icon: ListenableBuilder(listenable: lce, builder: (context, _) {
                return Icon(
                  lce.result!.isFavorite ? Icons.favorite : Icons
                      .favorite_border,
                  color: AppColors.favColor,
                );
              }),
            )
          ] : []
        ),
        body: _movieDetailBody(lce, column),
      );
    });
  }



  Widget _movieDetailBody(LCEElement<MovieDetail> lce, int column) {
    if (lce.loading && lce.result == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (lce.result != null) {
      final movie = lce.result as MovieDetail;
      if (column == 1) {
        return _singleColumn(movie);
      } else if (column == 2) {
        return _doubleColumn(movie);
      } else {
        return Text('non support layout');
      }
    } else if (lce.error != null) {
      return Text("error");
    }
    return Text("error");
  }

  Widget _singleColumn(MovieDetail movie) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        MovieDetailHeader(movie: movie),
        SizedBox(height: 24,),
        MovieDetailBody(overview: movie.overView),
        SizedBox(height: 24,),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Text("Cast", style: Theme.of(context).textTheme.titleMedium,),
        ),
        SizedBox(height: 12,),
        ...movie.casts.map((cast) =>
            MovieDetailCast(cast: cast)
        ),
        SizedBox(height: 24,)
      ],
    );
  }

  Widget _doubleColumn(MovieDetail movie) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: MovieDetailHeader(movie: movie),
        ),
        Expanded(
          child:  ListView(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                child: Text(movie.title, style: Theme.of(context).textTheme.titleLarge,),
              ),
              SizedBox(height: 24,),
              MovieDetailBody(overview: movie.overView),
              SizedBox(height: 24,),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                child: Text("Cast", style: Theme.of(context).textTheme.titleMedium,),
              ),
              SizedBox(height: 12,),
              ...movie.casts.map((cast) =>
                  MovieDetailCast(cast: cast)
              )
            ],
          )
        ),
      ]
    );
  }
}