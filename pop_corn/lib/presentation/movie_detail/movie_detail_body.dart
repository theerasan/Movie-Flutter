import 'package:flutter/material.dart';

class MovieDetailBody extends StatelessWidget {

  const MovieDetailBody({super.key, required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Overview", style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 12,),
            Text(overview, style: Theme.of(context).textTheme.bodyMedium,)
          ]
      ),
    );
  }
}