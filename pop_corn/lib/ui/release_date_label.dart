import 'package:flutter/material.dart';
import 'package:pop_corn/ui/core/theme/colors.dart';

import 'core/sizing.dart';

class ReleaseDateLabel extends StatelessWidget {

  const ReleaseDateLabel({super.key, required this.releaseDate});

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.calendar_today_rounded, color: AppColors.grey3, size: AppSizing.l),
        BoxSizing.s,
        Text(releaseDate, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}