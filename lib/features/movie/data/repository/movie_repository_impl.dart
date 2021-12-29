import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_test/core/error/exception.dart';
import 'package:movie_app_test/core/error/failure.dart';
import 'package:movie_app_test/features/movie/data/datasource/movie_remote_datasource.dart';
import 'package:movie_app_test/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app_test/features/movie/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this.remoteDataSource);

  final MovieRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    try {
      final movies = await remoteDataSource.getMovies();
      return Right(movies);
    } catch (e) {
      if (e is NoInterterException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        if (e.response != null && e.response!.data != null) {
          return Left(
            ServerFailure(
              message: e.response!.data['status_message'],
            ),
          );
        }
      } else {
        return const Left(
          ServerFailure(
            message: 'Something went wrong, please try again',
          ),
        );
      }

      return Left(UnknownFailure());
    }
  }
}
