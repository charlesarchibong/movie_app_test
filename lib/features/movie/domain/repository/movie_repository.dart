import 'package:dartz/dartz.dart';
import 'package:movie_app_test/core/error/failure.dart';
import 'package:movie_app_test/features/movie/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovies();
}
