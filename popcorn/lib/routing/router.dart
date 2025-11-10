import 'package:go_router/go_router.dart';
import 'package:popcorn/presentation/movie_detail/movie_detail_screen.dart';
import 'package:popcorn/presentation/movie_detail/movie_detail_viewmodel.dart';
import 'package:popcorn/presentation/movie_list/movie_list_screen.dart';
import 'package:popcorn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:popcorn/routing/routes.dart';
import 'package:provider/provider.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.movieList,
  routes: [
    GoRoute(
      path: Routes.movieList,
      builder: (context, state) {
        return MovieListScreen(
          viewModel: Provider.of<MovieListViewModel>(context),
        );
      },
    ),
    GoRoute(
      path: Routes.movieDetail,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final viewModel = Provider.of<MovieDetailViewModel>(context);
        return MovieDetailScreen(viewModel: viewModel, id: id);
      },
    ),
  ],
);
