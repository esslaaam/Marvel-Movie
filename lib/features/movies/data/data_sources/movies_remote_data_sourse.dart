import 'package:flutter/material.dart';
import 'package:movie_app/core/local/app_config.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieEntity>> fetchMovies({int pageNumber = 0});

  Future<List<MovieEntity>> fetchSearchMovies({required SearchModel searchModel});
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  @override
  Future<List<MovieEntity>> fetchMovies({int pageNumber = 0}) async {
    debugPrint("${AppConfig.characters}?apikey=$kApiKey&hash=$kHashKey&ts=$kTs&limit=15&offset=${15 * pageNumber}");
    var data = await ApiServices().get(
        endPoint: "${AppConfig.characters}?apikey=$kApiKey&hash=$kHashKey&ts=$kTs&limit=15&offset=${15 * pageNumber}");
    List<MovieEntity> movies = getListMovies(data);
    return movies;
  }

  List<MovieEntity> getListMovies(Map<String, dynamic> data) {
    List<MovieEntity> movies = [];
    for (var moviesMaps in data["data"]["results"]) {
      movies.add(MovieModel.fromJson(moviesMaps));
    }
    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchSearchMovies({required SearchModel searchModel}) async {
    debugPrint("${AppConfig.characters}?apikey=$kApiKey&hash=$kHashKey&ts=$kTs&limit=15&offset=${15 * searchModel.pageNumber}&nameStartsWith=${searchModel.textSearch}");
    var data = await ApiServices().get(
        endPoint: "${AppConfig.characters}?apikey=$kApiKey&hash=$kHashKey&ts=$kTs&limit=15&offset=${15 * searchModel.pageNumber}&nameStartsWith=${searchModel.textSearch}");
    List<MovieEntity> moviesResult = getListMovies(data);
    return moviesResult;
  }
}
