import 'package:hive/hive.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MovieDetailsRemoteDataSource {

  Future<MovieDetailsEntity> fetchMovieDetails({required int id});
}

class MovieDetailsRemoteDataSourceImpl extends MovieDetailsRemoteDataSource {
  @override
  Future<MovieDetailsEntity> fetchMovieDetails({required int id}) {
    // TODO: implement fetchMovieDetails
    throw UnimplementedError();
  }

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
