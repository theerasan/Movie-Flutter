import 'package:flutter/material.dart';
import 'package:pop_corn/domain/model/cast.dart';

class MovieDetailCast extends StatelessWidget {

  const MovieDetailCast({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    var characterColor = Theme.of(context).textTheme.bodySmall?.color?.withAlpha(128);
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (cast.avatarUrl != null) ? CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              cast.avatarUrl!,
            ),
          ) : CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('images/poster_placeholder.png')
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
              SizedBox(height: 4,),
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