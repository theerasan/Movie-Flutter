import 'package:flutter/material.dart';
import 'package:pop_corn/ui/core/sizing.dart';
import 'package:pop_corn/ui/core/theme/colors.dart';

class VoteLabel extends StatelessWidget {
  const VoteLabel({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, size: AppSizing.l, color: AppColors.star),
        BoxSizing.xs,
        Text(
          rating.toStringAsFixed(1),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.star,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
