import 'dart:convert';

import '../../../config/assets.dart';
import 'package:flutter/services.dart';
import 'package:pop_corn/data/model/movie_list/movie_list_dto.dart';
import 'package:pop_corn/data/services/movie_service.dart';

class LocalMovieService implements MovieService {

  static final MovieService _instance = LocalMovieService._internal();

  LocalMovieService._internal();

  factory LocalMovieService() {
    return _instance as LocalMovieService;
  }

  Future<MovieListDTO> getMovies(int page) async {
    if (page == 1) {
      final localData = await rootBundle.loadString(Assets.moviePage1);
      return MovieListDTO.fromJson(jsonDecode(localData));
    }
    if (page == 2) {
      final localData = await rootBundle.loadString(Assets.moviePage2);
      return MovieListDTO.fromJson(jsonDecode(localData));
    }

    print('error in service');
    throw Exception('Page not found');
  }
}