import 'package:hive/hive.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieEntity>> fetchMovies({int pageNumber = 0});

}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  @override
  Future<List<MovieEntity>> fetchMovies({int pageNumber = 0}) {
    // TODO: implement fetchMovies
    throw UnimplementedError();
  }
  // final ApiServices apiServices;
  //
  // HomeRemoteDataSourceImpl(this.apiServices);
  //
  // @override
  // Future<List<BookEntity>> fetchBookImages({int pageNumber = 0}) async {
  //   var data = await apiServices.get(endPoint: "volumes?q=programming&Filtering=free-ebooks&startIndex=${pageNumber * 10}");
  //   List<BookEntity> books = getListBooks(data);
  //   saveBooksData(books,kFeaturedBox);
  //   return books;
  // }
  //
  //
  //
  // @override
  // Future<List<BookEntity>> fetchBooks() async {
  //   var data = await apiServices.get(endPoint: "volumes?q=programming&Filtering=free-ebooks&Sorting=newest");
  //   List<BookEntity> books = getListBooks(data);
  //   saveBooksData(books,kNewestBox);
  //   return books;
  // }
  //
  // List<BookEntity> getListBooks(Map<String, dynamic> data) {
  //   List<BookEntity> books = [];
  //
  //   for (var booksMaps in data["items"]) {
  //     books.add(BookModel.fromJson(booksMaps));
  //   }
  //   return books;
  // }
  //
  // void saveBooksData(List<BookEntity> books , String boxName) {
  //   var box = Hive.box<BookEntity>(boxName);
  //   box.addAll(books);
  // }
}
