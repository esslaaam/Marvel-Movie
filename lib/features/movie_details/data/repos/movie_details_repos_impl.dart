import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movie_details/data/data_sources/movie_details_local_data_source.dart';
import 'package:movie_app/features/movie_details/data/data_sources/movie_details_remote_data_sourse.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repo.dart';

class MovieDetailsReposImpl extends MovieDetailsRepo {
  final MovieDetailsLocalDataSource detailsLocalDataSource;

  final MovieDetailsRemoteDataSource detailsRemoteDataSource;

  MovieDetailsReposImpl(
      {required this.detailsLocalDataSource,
      required this.detailsRemoteDataSource});

  @override
  Future<Either<Failure, MovieDetailsEntity>> fetchMovieDetails(
      {required int id}) async {
    MovieDetailsEntity? moviesDetails;
    try {
      moviesDetails = detailsLocalDataSource.fetchMovieDetails(id: id);
      if (moviesDetails != null) {
        return right(moviesDetails);
      } else {
        moviesDetails = await detailsRemoteDataSource.fetchMovieDetails(id: id);
        return right(moviesDetails);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
