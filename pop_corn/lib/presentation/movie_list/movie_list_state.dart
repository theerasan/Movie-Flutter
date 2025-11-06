class MovieListState {

  String query;
  MovieListAppBarState state;

  MovieListState({required this.state, required this.query});
}

enum MovieListAppBarState {
  TITLE_BAR,
  SEARCH_BAR
}