import 'package:dartz/dartz.dart';
import 'package:movie_app_test/core/error/failure.dart';
import 'package:movie_app_test/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app_test/features/movie/domain/repository/movie_repository.dart';

class GetMovieUsecase {
  GetMovieUsecase({
    required this.movieRepository,
  });

  final MovieRepository movieRepository;

  Future<Either<Failure, List<MovieEntity>>> call(int pageNumber) {
    return movieRepository.getMovies();
  }
}
