import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_corn/domain/model/movie.dart';
import 'package:pop_corn/domain/model/movie_page_data.dart';
import 'package:pop_corn/presentation/movie_list/movie_card.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_state.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:pop_corn/routing/routes.dart';
import 'package:pop_corn/ui/core/sizing.dart';
import 'package:pop_corn/ui/lce_element.dart';

import '../../l10n/app_localizations.dart';
import '../../ui/error_screen.dart';
import '../../ui/generic_error_screen.dart';

class MovieListScreen extends StatefulWidget {
  final MovieListViewModel viewModel;

  const MovieListScreen({super.key, required this.viewModel});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_onScroll);
      widget.viewModel.onEnterScreen();
    });
  }

  void _onClickMovieItem(num id) async {
    await context.push(Routes.movieDetailWithId(id));
    widget.viewModel.updateFavoriteById(id);
  }

  void _onClickFavorite(Movie movie) {
    widget.viewModel.onClickFavorite(movie);
  }

  AppBar _getAppBarState(MovieListAppBarState state) {
    switch (state) {
      case MovieListAppBarState.titleBar:
        return AppBar(
          title: Text(AppLocalizations.of(context)!.app_name),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: widget.viewModel.onClickSearch,
              icon: Icon(Icons.search_rounded),
            ),
          ],
        );
      case MovieListAppBarState.searchBar:
        final TextEditingController searchController = TextEditingController(
          text: widget.viewModel.appBarState.query,
        );
        return AppBar(
          title: TextField(
            autofocus: true,
            controller: searchController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.search,
              border: InputBorder.none,
            ),
            onChanged: (query) {
              widget.viewModel.search(query);
            },
          ),
          actions: [
            IconButton(
              onPressed: widget.viewModel.onClickCloseSearch,
              icon: Icon(Icons.close_rounded),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var column = 1;
    if (width > AppSizing.smallBreakPoint) {
      column = 2;
    }

    return Scaffold(
      appBar: _getAppBarState(widget.viewModel.appBarState.state),
      body: ListenableBuilder(
        listenable: widget.viewModel.lceElement,
        builder: (context, _) {
          return movieListBody(width, column);
        },
      ),
    );
  }

  Widget movieListBody(double width, int column) {
    final movie = widget.viewModel.lceElement;
    if (widget.viewModel.lceElement.loading &&
        widget.viewModel.lceElement.result == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      final result = widget.viewModel.lceElement.result;
      if (result != null) {
        return movieList(width, column, result, movie);
      }

      return ListView(
        children: [GenericErrorScreen(onRetry: widget.viewModel.onEnterScreen)],
      );
    }
  }

  Widget movieList(
    double width,
    int column,
    MoviePageData moviePageData,
    LCEElement<MoviePageData> moviePage,
  ) {
    final movies = moviePageData.movies;
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (movies.isEmpty) {
          return ListView(
            children: [
              ErrorScreen(
                errorMessage: AppLocalizations.of(context)!.empty_movie_list,
                imagePath: 'images/empty_list.png',
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(left: AppSizing.l),
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: column,
                    childAspectRatio: width / column / AppSizing.coverSmall,
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
                  },
                ),
              ),
              if (moviePage.loading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSizing.xxl),
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        }
      },
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      widget.viewModel.loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
