import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/local/app_config.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_model.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsEntity> fetchMovieDetails({required int id});
}
@Injectable(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl extends MovieDetailsRemoteDataSource {
  @override
  Future<MovieDetailsEntity> fetchMovieDetails({required int id}) async {
    debugPrint("${AppConfig.characters}/$id?apikey=$kApiKey&hash=$kHashKey&ts=$kTs");
    var data = await ApiServices().get(endPoint: "${AppConfig.characters}/$id?apikey=$kApiKey&hash=$kHashKey&ts=$kTs");
    MovieDetailsEntity movieDetails = MovieDetailsModel.fromJson(data);
    saveBooksData(movieDetails);
    return movieDetails;
  }
  void saveBooksData(MovieDetailsEntity movieDetails) {
  var box = Hive.box<MovieDetailsEntity>(kMovieDetailsBox);
  box.add(movieDetails);
}

}
