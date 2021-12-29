import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app_test/core/error/exception.dart';
import 'package:movie_app_test/features/movie/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies();
}

class MoviwRemoteDataSourceImpl implements MovieRemoteDataSource {
  MoviwRemoteDataSourceImpl({
    required this.dataConnectionChecker,
    required this.dio,
  });

  final InternetConnectionChecker dataConnectionChecker;
  final Dio dio;

  @override
  Future<List<MovieModel>> getMovies() async {
    if (await dataConnectionChecker.hasConnection) {
      final response = await dio.get(
        'https://api.themoviedb.org/3/discover/movie',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${dotenv.env['TOKEN']}',
          },
        ),
      );
      return (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw NoInterterException();
    }
  }
}
