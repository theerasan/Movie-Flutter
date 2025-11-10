import 'package:flutter/material.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/l10n/app_localizations.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_body.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_cast.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_header.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_viewmodel.dart';
import 'package:pop_corn/ui/core/theme/colors.dart';
import 'package:pop_corn/ui/lce_element.dart';

import '../../ui/core/sizing.dart';
import '../../ui/generic_error_screen.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.viewModel, required this.id});
  final MovieDetailViewModel viewModel;
  final int id;

  @override
  State<StatefulWidget> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  final ScrollController _scrollController = ScrollController();
  double _appBarAlpha = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.setId = widget.id;
      _scrollController.addListener(_onScroll);
    });
  }

  @override
  Widget build(BuildContext context) {
    final lce = widget.viewModel.lceElement;
    final width = MediaQuery.of(context).size.width;
    var column = 1;
    if (width > AppSizing.smallBreakPoint) {
      column = 2;
    }
    return ListenableBuilder(listenable: lce, builder: (context, _) {
      final bg = Theme.of(context).appBarTheme.backgroundColor;
      final bgColor = bg?.withValues(
        alpha: _appBarAlpha,
        red: bg.r * 0.95,
        green: bg.g * 0.95,
        blue: bg.b * 0.95
      );
      return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          title: (lce.result != null && column == 1) ? Text(lce.result!.title) : SizedBox
              .shrink(),
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          backgroundColor: bgColor,
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
        return Center(
          child: GenericErrorScreen(onRetry: widget.viewModel.onRetry)
        );
      }
    }
    return Center(
        child: GenericErrorScreen(onRetry: widget.viewModel.onRetry)
    );
  }

  Widget _singleColumn(MovieDetail movie) {
    return ListView(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      children: [
        MovieDetailHeader(movie: movie),
        BoxSizing.xxl,
        MovieDetailBody(overview: movie.overview),
        BoxSizing.xxl,
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: AppSizing.xxl),
          child: Text(
            AppLocalizations.of(context)!.movie_detail_cast,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        BoxSizing.m,
        ...movie.casts.map((cast) =>
            MovieDetailCast(cast: cast)
        ),
        BoxSizing.xxl,
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
                padding: EdgeInsetsGeometry.symmetric(horizontal: AppSizing.xxl),
                child: Text(movie.title, style: Theme.of(context).textTheme.titleLarge,),
              ),
              BoxSizing.xxl,
              MovieDetailBody(overview: movie.overview),
              BoxSizing.xxl,
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: AppSizing.xxl),
                child: Text(AppLocalizations.of(context)!.movie_detail_cast, style: Theme.of(context).textTheme.titleMedium,),
              ),
              BoxSizing.m,
              ...movie.casts.map((cast) =>
                  MovieDetailCast(cast: cast)
              )
            ],
          )
        ),
      ]
    );
  }

  void _onScroll() {
    setState(() {
      double offset = _scrollController.offset;
      _appBarAlpha = (offset / 100).clamp(0.0, 0.9);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}