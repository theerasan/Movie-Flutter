import 'package:flutter/material.dart';
import 'package:popcorn/ui/core/sizing.dart';
import 'package:popcorn/ui/core/theme/colors.dart';

class GenreLabel extends StatelessWidget {
  const GenreLabel({super.key, required this.genre});

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.movie, color: AppColors.grey3, size: AppSizing.l),
        BoxSizing.s,
        Text(genre, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
