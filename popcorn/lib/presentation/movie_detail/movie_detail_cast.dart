import 'package:flutter/material.dart';
import 'package:popcorn/domain/model/cast.dart';
import 'package:popcorn/ui/core/sizing.dart';

class MovieDetailCast extends StatelessWidget {
  const MovieDetailCast({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: AppSizing.xxl,
        vertical: AppSizing.s,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          (cast.avatarUrl != null)
              ? CircleAvatar(
                  radius: 25,
                  foregroundImage: NetworkImage(cast.avatarUrl!),
                  backgroundImage: AssetImage('images/avatar_placeholder.png'),
                )
              : CircleAvatar(
                  radius: 25,
                  foregroundImage: AssetImage('images/avatar_placeholder.png'),
                ),
          BoxSizing.l,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cast.fullName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                BoxSizing.xs,
                Text(
                  cast.character,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
