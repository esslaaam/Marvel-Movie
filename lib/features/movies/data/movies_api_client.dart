import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/local/app_config.dart';

part 'movies_api_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class MoviesApiClient {
  factory MoviesApiClient(Dio dio, {String baseUrl}) = _MoviesApiClient;

  @GET(AppConfig.characters)
  Future<MoviesModel> fetchMovies({
    @Query('apikey') String apiKey = kApiKey,
    @Query('hash') String hash = kHashKey,
    @Query('ts') String ts = kTs,
    @Query('limit') String limit = '15',
    @Query('offset') int pageNumber = 0,
  });

  @GET(AppConfig.characters)
  Future<MoviesModel> fetchSearchMovies({
    @Query('apikey') String apiKey = kApiKey,
    @Query('hash') String hash = kHashKey,
    @Query('ts') String ts = kTs,
    @Query('limit') String limit = '15',
    @Query('offset') int pageNumber = 0,
    @Query('nameStartsWith') required String textSearch,
  });
}
