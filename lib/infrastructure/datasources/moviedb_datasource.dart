import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/config/domain/entities/movie.dart';
import 'package:dio/dio.dart';

import '../../config/domain/datasources/movies_datasource.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Environment.theMovieDbKey,
        "language": "es-MX"
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get("/movie/now_playing");
    final List<Movie> movies = [];

    return [];
  }
}
