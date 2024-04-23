import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/movies/data/networking/movies_api_client.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio();
  MoviesApiClient getMoviesApiClient() => MoviesApiClient(dio);
}