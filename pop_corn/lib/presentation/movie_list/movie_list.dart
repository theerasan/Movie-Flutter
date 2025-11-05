import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_corn/domain/model/movie.dart';
import 'package:pop_corn/domain/model/movie_page_data.dart';
import 'package:pop_corn/presentation/movie_list/movie_card.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:pop_corn/routing/routes.dart';
import 'package:pop_corn/ui/lce_element.dart';

class MovieList extends StatefulWidget {

  final MovieListViewModel viewModel;
  const MovieList({
    super.key,
    required this.viewModel
  });

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        widget.viewModel.loadMore();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.onEnterScreen();
    });
  }

  void _onClickMovieItem(num id) {
    context.push(Routes.movieDetailWithId(id));
  }

  void _onClickFavorite(Movie movie) {
    widget.viewModel.onClickFavorite(movie);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Movie'),
      centerTitle: true,
    );

    final width = MediaQuery.of(context).size.width;
    var column = 1;
    if (width > 600 ) {
      column = 2;
    }

    return Scaffold(
      appBar: appBar,
      body: ListenableBuilder(listenable: widget.viewModel.lceElement, builder: (context, _) {
        return movieListBody(width, column);
      })
    );
  }

  Widget movieListBody(double width, int column) {
    final movie = widget.viewModel.lceElement;
    if (widget.viewModel.lceElement.loading && widget.viewModel.lceElement.result == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final result = widget.viewModel.lceElement.result;
      if (result != null) {
        return movieList(width, column, result, movie);
      }

      return Text('error');
    }
  }

  Widget movieList(double width, int column, MoviePageData moviePageData, LCEElement<MoviePageData> moviePage) {
    final movies = moviePageData.movies;
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: column,
                    childAspectRatio: width / column / 155
                ),
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = movies[index];
                  return MovieCard(
                    movie: movie,
                    onClickMovieItem: () {
                      _onClickMovieItem(movie.id);
                    },
                    onClickFavorite: () {
                      _onClickFavorite(movie);
                    },
                  );
                }
              )
            ),
            if (moviePage.loading)
              const Center(
                child: Padding(padding: EdgeInsets.all(24.0),
                  child: CircularProgressIndicator(),
                )
              ),
          ],
        );
      },
    );
  }
}