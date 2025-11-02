import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key, required this.id});
  
  final num id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: Text('Movie id: $id'),
    );
  }
  
}