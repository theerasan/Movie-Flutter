import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_corn/domain/model/movie.dart';
import 'package:pop_corn/domain/model/movie_page_data.dart';
import 'package:pop_corn/presentation/movie_list/movie_card.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_state.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:pop_corn/routing/routes.dart';
import 'package:pop_corn/ui/lce_element.dart';

class MovieListScreen extends StatefulWidget {

  final MovieListViewModel viewModel;
  const MovieListScreen({
    super.key,
    required this.viewModel
  });

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {

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

  AppBar _getAppBarState(MovieListAppBarState state) {
    switch (state) {
      case MovieListAppBarState.TITLE_BAR:
        return AppBar(
          title: Text('Popcorn'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: widget.viewModel.onClickSearch,
              icon: Icon(Icons.search_rounded)
            )
          ],
        );
      case MovieListAppBarState.SEARCH_BAR:
        final TextEditingController searchController = TextEditingController(text: widget.viewModel.appBarState.query);
        return AppBar(
          title: TextField(
            autofocus: true,
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
            ),
            onChanged: (query) {
              widget.viewModel.search(query);
            },
          ),
          actions: [
            IconButton(
              onPressed: widget.viewModel.onClickCloseSearch,
              icon: Icon(Icons.close_rounded)
            )
          ]
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var column = 1;
    if (width > 600 ) {
      column = 2;
    }

    return Scaffold(
      appBar: _getAppBarState(widget.viewModel.appBarState.state),
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
                    key: ValueKey(movie.id),
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