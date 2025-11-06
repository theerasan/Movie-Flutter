import 'dart:convert';

import 'package:pop_corn/data/model/movie_detail/movie_detail_dto.dart';
import 'package:pop_corn/data/model/movie_list/movie_list_dto.dart';
import 'package:pop_corn/data/services/movie_service.dart';
import 'package:http/http.dart' as http;

class RemoteMovieService implements MovieService {

  // TMDb API constants
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  final String _accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZTUyZjUzNjdlMGEzY2JhODZhYTA3MTc3OTA2MDIwMSIsIm5iZiI6MTczNDA1Njk2OS4wOTYsInN1YiI6IjY3NWI5YzA5ZjFiZjdhNjBkZmY5YzE5MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7HIaaELwE_YZI--6E3ndwkwMl0mqprOC-Qq66H77zdY';

  // Get request headers with authorization
  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer $_accessToken',
      'accept': 'application/json',
    };
  }

  static final MovieService _instance = RemoteMovieService._internal();

  RemoteMovieService._internal();

  factory RemoteMovieService() {
    return _instance as RemoteMovieService;
  }

  @override
  Future<MovieListDTO> getMovies(int page) async {
    final response = await http.get(
        Uri.parse('$_baseUrl/movie/now_playing?language=en-US&page=$page'),
        headers: _getHeaders()
    );

    if (response.statusCode == 200) {
      return MovieListDTO.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<MovieDetailDTO> getMovieDetailById(int id) {
    // TODO: implement getMovieDetailById
    throw UnimplementedError();
  }
}