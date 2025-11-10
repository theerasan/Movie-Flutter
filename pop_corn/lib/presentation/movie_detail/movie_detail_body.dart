import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../ui/core/sizing.dart';

class MovieDetailBody extends StatelessWidget {

  const MovieDetailBody({super.key, required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: AppSizing.xxl),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.movie_detail_overview, style: Theme.of(context).textTheme.titleMedium,),
            BoxSizing.m,
            Text(overview, style: Theme.of(context).textTheme.bodyMedium,)
          ]
      ),
    );
  }
}