import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movies/data/data_sources/movies_local_data_source.dart';
import 'package:movie_app/features/movies/data/data_sources/movies_remote_data_sourse.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repo.dart';

class MoviesReposImpl extends MoviesRepo {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  final MoviesLocalDataSource moviesLocalDataSource;

  MoviesReposImpl({required this.moviesRemoteDataSource, required this.moviesLocalDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchMovies({int pageNumber = 0}) {
    // TODO: implement fetchMovies
    throw UnimplementedError();
  }
  

  // @override
  // Future<Either<Failure, List<BookEntity>>> fetchBookImages({int pageNumber = 0}) async {
  //   List<BookEntity> books ;
  //   try {
  //     books = homeLocalDataSource.fetchBookImages(pageNumber: pageNumber);
  //     if(books.isNotEmpty){
  //       return right(books);
  //     }else{
  //       books = await homeRemoteDataSource.fetchBookImages(pageNumber: pageNumber);
  //       return right(books);
  //     }
  //   } catch (e) {
  //     if(e is DioException){
  //
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, List<BookEntity>>> fetchBooks()async {
  //   List<BookEntity> books ;
  //   try {
  //     books = homeLocalDataSource.fetchBooks();
  //     if(books.isNotEmpty){
  //       return right(books);
  //     }else{
  //       books = await homeRemoteDataSource.fetchBooks();
  //       return right(books);
  //     }
  //   } catch (e) {
  //     if(e is DioException){
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
}
