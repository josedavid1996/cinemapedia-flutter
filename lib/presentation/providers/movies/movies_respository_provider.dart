import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/repositories/movie_respository_impl.dart';

// SOLO LECTURA INMUTABLE
final movieRespositoryProvider = Provider((ref) {
  return MovieRespositoryImpl(MoviedbDatasource());
});
