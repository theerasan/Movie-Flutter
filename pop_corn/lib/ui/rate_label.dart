import 'package:flutter/material.dart';
import 'package:pop_corn/ui/core/theme/colors.dart';

class RateLabel extends StatelessWidget {

  final bool isAdult;

  const RateLabel({super.key, required this.isAdult});

  @override
  Widget build(BuildContext context) {
    var color = AppColors.info;
    var rateText = 'PG-13';
    if (isAdult) {
      color = AppColors.danger;
      rateText = 'PC-17';
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 1, horizontal: 4),
        child: Text(
          rateText,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
        ),
      ),
    );
  }

}