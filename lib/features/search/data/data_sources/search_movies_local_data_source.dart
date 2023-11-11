import 'package:movie_app/features/search/domain/entities/search_movie_entity.dart';

abstract class SearchMoviesLocalDataSource {
  List<SearchMovieEntity> fetchSearchMovies({int pageNumber = 0});
}

class SearchMoviesLocalDataSourceImpl extends SearchMoviesLocalDataSource {

  @override
  List<SearchMovieEntity> fetchSearchMovies({int pageNumber = 0}) {
    // TODO: implement fetchSearchMovies
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
