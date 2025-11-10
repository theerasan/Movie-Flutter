import 'dart:convert';

import 'package:popcorn/data/model/movie_detail/movie_detail_dto.dart';
import 'package:popcorn/data/model/movie_list/movie_list_dto.dart';
import 'package:popcorn/data/services/movie_service.dart';
import 'package:http/http.dart' as http;
import 'package:popcorn/data/services/service_config.dart';

class RemoteMovieService implements MovieService {
  // TMDb API constants
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  // Get request headers with authorization
  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer ${ServiceConfig.apiToken}',
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
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      return MovieListDTO.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<MovieDetailDTO> getMovieDetailById(int id) async {
    final response = await http.get(
      Uri.parse(
        '$_baseUrl/movie/$id?language=en-US&append_to_response=credits',
      ),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      return MovieDetailDTO.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie with id $id');
    }
  }

  @override
  Future<MovieListDTO> searchMovies(String query, int page) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search/movie?query=$query&page=$page'),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      try {
        return MovieListDTO.fromJson(jsonDecode(response.body));
      } catch (e) {
        throw Exception('Failed to load movies');
      }
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
