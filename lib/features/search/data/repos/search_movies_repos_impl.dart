import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/search/data/data_sources/search_movies_local_data_source.dart';
import 'package:movie_app/features/search/data/data_sources/search_movies_remote_data_sourse.dart';
import 'package:movie_app/features/search/domain/entities/search_movie_entity.dart';
import 'package:movie_app/features/search/domain/repositories/search_movies_repo.dart';

class SearchMoviesReposImpl extends SearchMoviesRepo {
  final SearchMoviesRemoteDataSource searchMoviesRemoteDataSource;

  final SearchMoviesLocalDataSource searchMoviesLocalDataSource;

  SearchMoviesReposImpl({required this.searchMoviesRemoteDataSource, required this.searchMoviesLocalDataSource});

  @override
  Future<Either<Failure, List<SearchMovieEntity>>> fetchSearchMovies({int pageNumber = 0}) {
    // TODO: implement fetchSearchMovies
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
