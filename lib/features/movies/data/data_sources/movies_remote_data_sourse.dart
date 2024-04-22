import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/data/movies_api_client.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieEntity>> fetchMovies({int pageNumber = 0});

  Future<List<MovieEntity>> fetchSearchMovies(
      {required SearchModel searchModel});
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  final MoviesApiClient moviesApiClient;

  MoviesRemoteDataSourceImpl({required this.moviesApiClient});

  @override
  Future<List<MovieEntity>> fetchMovies({int pageNumber = 0}) async {
    var movies = await moviesApiClient.fetchMovies(
      pageNumber: pageNumber,
    );
    List<MovieEntity> moviesResult = getListMovies(movies.data!.results);
    return moviesResult;
  }

  List<MovieEntity> getListMovies(movies) {
    List<MovieEntity> moviesResult = [];
    moviesResult.addAll(movies);
    return moviesResult;
  }

  @override
  Future<List<MovieEntity>> fetchSearchMovies({required SearchModel searchModel}) async {
    var movies = await moviesApiClient.fetchSearchMovies(
      pageNumber: searchModel.pageNumber,
      textSearch: searchModel.textSearch,
    );
    List<MovieEntity> moviesResult = getListMovies(movies.data!.results);
    return moviesResult;
  }
}
