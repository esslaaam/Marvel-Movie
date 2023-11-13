import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movies/data/data_sources/movies_remote_data_sourse.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repo.dart';

class MoviesReposImpl extends MoviesRepo {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesReposImpl({required this.moviesRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchMovies(
      {int pageNumber = 0}) async {
    List<MovieEntity> movies;
    try {
      movies = await moviesRemoteDataSource.fetchMovies(pageNumber: pageNumber);
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchSearchMovies(
      {required SearchModel searchModel}) async {
    List<MovieEntity> moviesResult;
    try {
      moviesResult = await moviesRemoteDataSource.fetchSearchMovies(
          searchModel: searchModel);
      return right(moviesResult);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
