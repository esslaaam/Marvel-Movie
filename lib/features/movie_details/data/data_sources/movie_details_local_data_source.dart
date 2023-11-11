import 'package:hive/hive.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsLocalDataSource {
  MovieDetailsEntity fetchMovieDetails({required int id});
}

class MovieDetailsLocalDataSourceImpl extends MovieDetailsLocalDataSource {
  @override
  MovieDetailsEntity fetchMovieDetails({required int id}) {
    // TODO: implement fetchMovieDetails
    throw UnimplementedError();
  }

  // @override
  // List<MovieEntity> fetchMovieDetails() {
  //   int startIndex = pageNumber * 10 ;
  //   int endIndex = (pageNumber + 1) * 10 ;
  //   var box = Hive.box<BookEntity>(kFeaturedBox);
  //   int length = box.values.length ;
  //   if(startIndex >= length || endIndex > length){
  //     return [] ;
  //   }
  //   return box.values.toList().sublist(startIndex,endIndex);
  // }
  //
  // @override
  // List<BookEntity> fetchBooks() {
  //   var box = Hive.box<BookEntity>(kNewestBox);
  //   return box.values.toList();
  // }
}
