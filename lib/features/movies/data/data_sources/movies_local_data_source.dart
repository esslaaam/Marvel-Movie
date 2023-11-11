
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesLocalDataSource {
  List<MovieEntity> fetchMovies({int pageNumber = 0});


}

class MoviesLocalDataSourceImpl extends MoviesLocalDataSource {
  @override
  List<MovieEntity> fetchMovies({int pageNumber = 0}) {
    // TODO: implement fetchMovies
    throw UnimplementedError();
  }

  // @override
  // List<BookEntity> fetchBookImages({int pageNumber = 0}) {
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
