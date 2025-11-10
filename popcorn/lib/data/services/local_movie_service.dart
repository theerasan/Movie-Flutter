import 'dart:convert';

import 'package:popcorn/data/model/movie_detail/movie_detail_dto.dart';

import '../../../config/assets.dart';
import 'package:flutter/services.dart';
import 'package:popcorn/data/model/movie_list/movie_list_dto.dart';
import 'package:popcorn/data/services/movie_service.dart';

class LocalMovieService implements MovieService {
  static final MovieService _instance = LocalMovieService._internal();

  LocalMovieService._internal();

  factory LocalMovieService() {
    return _instance as LocalMovieService;
  }

  @override
  Future<MovieListDTO> getMovies(int page) async {
    if (page == 1) {
      final localData = await rootBundle.loadString(Assets.moviePage1);
      return MovieListDTO.fromJson(jsonDecode(localData));
    }
    if (page == 2) {
      final localData = await rootBundle.loadString(Assets.moviePage2);
      return MovieListDTO.fromJson(jsonDecode(localData));
    }

    throw Exception('Page not found');
  }

  @override
  Future<MovieDetailDTO> getMovieDetailById(int id) async {
    final localData = await rootBundle.loadString(Assets.movieDetail);
    return MovieDetailDTO.fromJson(jsonDecode(localData));
  }

  @override
  Future<MovieListDTO> searchMovies(String query, int page) async {
    if (page == 1) {
      final localData = await rootBundle.loadString(Assets.moviePage1);
      return MovieListDTO.fromJson(jsonDecode(localData));
    }
    if (page == 2) {
      final localData = await rootBundle.loadString(Assets.moviePage2);
      return MovieListDTO.fromJson(jsonDecode(localData));
    }

    throw Exception('Page not found');
  }
}
