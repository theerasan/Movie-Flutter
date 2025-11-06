import 'package:flutter/material.dart';
import 'package:pop_corn/domain/model/cast.dart';

class MovieDetailCast extends StatelessWidget {

  const MovieDetailCast({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {

    var characterColor = Theme.of(context).textTheme.bodySmall?.color?.withAlpha(128);

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              cast.avatarUrl,
            ),
          ),
          SizedBox(width: 16,),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cast.fullName,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8,),
              Text(
                cast.character,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12, color: characterColor),
              )
            ]
          )
        ],
      ),
    );
  }
}