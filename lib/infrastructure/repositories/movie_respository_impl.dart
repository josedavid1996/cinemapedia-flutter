import 'package:cinemapedia/config/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/config/domain/entities/movie.dart';

import '../../config/domain/respositories/movies_respository.dart';

class MovieRespositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRespositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
