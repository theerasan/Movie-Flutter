import 'package:flutter/material.dart';
import 'package:popcorn/domain/model/movie_detail.dart';
import 'package:popcorn/presentation/movie_detail/movie_detail_viewmodel.dart';
import 'package:popcorn/ui/favorite_button.dart';

import '../../ui/core/sizing.dart';
import '../../ui/generic_error_screen.dart';
import '../../ui/lce_element.dart';
import 'movie_detail_double_column.dart';
import 'movie_detail_single_column.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    super.key,
    required this.viewModel,
    required this.id,
  });
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
      widget.viewModel.setId(widget.id);
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
    return ListenableBuilder(
      listenable: lce,
      builder: (context, _) {
        final bg = Theme.of(context).appBarTheme.backgroundColor;
        final bgColor = bg?.withValues(
          alpha: _appBarAlpha,
          red: bg.r * 0.95,
          green: bg.g * 0.95,
          blue: bg.b * 0.95,
        );
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            title: (lce.result != null && column == 1)
                ? Text(lce.result!.title)
                : SizedBox.shrink(),
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            backgroundColor: bgColor,
            actions: _getActionButtons(lce.result),
          ),
          body: _movieDetailBody(lce, column),
        );
      },
    );
  }

  List<FavoriteButton>? _getActionButtons(MovieDetail? detail) {
    if (detail != null) {
      return [
        FavoriteButton(
          isFavorite: detail.isFavorite,
          onClickFavorite: () {
            widget.viewModel.onClickFavorite(detail);
          },
        ),
      ];
    } else {
      return null;
    }
  }

  Widget _movieDetailBody(LCEElement<MovieDetail> lce, int column) {
    if (lce.loading && lce.result == null) {
      return Center(child: CircularProgressIndicator());
    } else if (lce.result != null) {
      final movie = lce.result as MovieDetail;
      if (column == 1) {
        return MovieDetailSingleColumn(
          movie: movie,
          scrollController: _scrollController,
        );
      } else if (column == 2) {
        return MovieDetailDoubleColumn(movie: movie);
      } else {
        return Center(
          child: GenericErrorScreen(onRetry: widget.viewModel.onRetry),
        );
      }
    }
    return Center(child: GenericErrorScreen(onRetry: widget.viewModel.onRetry));
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      double offset = _scrollController.offset;
      _appBarAlpha = (offset / 100).clamp(0.0, 0.9);
    });
  }
}
