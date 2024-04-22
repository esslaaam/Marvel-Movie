import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movie_details/data/data_sources/movie_details_local_data_source.dart';
import 'package:movie_app/features/movie_details/data/data_sources/movie_details_remote_data_sourse.dart';
import 'package:movie_app/features/movie_details/data/repos/movie_details_repos_impl.dart';
import 'package:movie_app/features/movies/data/data_sources/movies_remote_data_sourse.dart';
import 'package:movie_app/features/movies/data/movies_api_client.dart';
import 'package:movie_app/features/movies/data/repos/movies_repos_impl.dart';

final getIt = GetIt.instance;


void setupServiceLocator (){

  /// Movies Implement
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<MoviesApiClient>(MoviesApiClient(getIt<Dio>()));
  getIt.registerSingleton<MoviesRemoteDataSource>(MoviesRemoteDataSourceImpl(moviesApiClient: getIt<MoviesApiClient>()));
  getIt.registerSingleton<MoviesReposImpl>(MoviesReposImpl(moviesRemoteDataSource: getIt<MoviesRemoteDataSource>()));

  /// Movie Details Implement
  getIt.registerSingleton<MovieDetailsReposImpl>(MovieDetailsReposImpl(
      detailsLocalDataSource: MovieDetailsLocalDataSourceImpl(),
      detailsRemoteDataSource: MovieDetailsRemoteDataSourceImpl()));

}