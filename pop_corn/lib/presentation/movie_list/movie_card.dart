import 'package:flutter/material.dart';
import 'package:pop_corn/presentation/movie_list/movie.dart';
import 'package:pop_corn/ui/core/theme/colors.dart';
import 'package:pop_corn/ui/rate_label.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.onClickMovieItem,
  });

  final Movie movie;
  final Function() onClickMovieItem;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {

  late final movieTitle = Column(
    children: [
      SizedBox(height: 8,),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 70,
              child: Text(
                widget.movie.title,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 2,
              ),
            ),
          )
        ],
      ),
    ],
  );

  late final ratingAndVote = Row(
    children: [
      RateLabel(isAdult: widget.movie.isAdult),
      SizedBox(width: 8,),
      Icon(Icons.star, size: 16, color: AppColors.star),
      Text(widget.movie.rating.toString(), style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.star)),
    ],
  );

  late final releaseDate = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(Icons.calendar_today_rounded, color: AppColors.grey3, size: 16),
      SizedBox(width: 8),
      Text(widget.movie.releaseDate, style: Theme.of(context).textTheme.labelSmall),
    ],
  );

  @override
  Widget build(BuildContext context) {
    var icon = Icons.favorite_border_rounded;
    if (widget.movie.isFavorite) {
      icon = Icons.favorite;
    }

    return SizedBox(
      height: 155,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: widget.onClickMovieItem,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage(
                height: 155,
                image: NetworkImage(widget.movie.posterUrl),
                placeholder: const AssetImage('images/poster_placeholder.png'),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    movieTitle,
                    Column(
                      children: [
                        ratingAndVote,
                        SizedBox(height: 12,),
                        releaseDate,
                        SizedBox(height: 16,)
                      ],
                    )
                  ]
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(icon, color: AppColors.favColor,)
              )
            ],
          ),
        )
      ),
    );
  }
}