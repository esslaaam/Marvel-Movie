import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsLocalDataSource {
  MovieDetailsEntity? fetchMovieDetails({required int id});
}
@Injectable(as: MovieDetailsLocalDataSource)
class MovieDetailsLocalDataSourceImpl extends MovieDetailsLocalDataSource {
  @override
  MovieDetailsEntity? fetchMovieDetails({required int id}) {
    var box = Hive.box<MovieDetailsEntity>(kMovieDetailsBox);
    List<MovieDetailsEntity> list = box.values.toList() ;
    MovieDetailsEntity element ;
    for (element in list) {
      if(id == element.filmId){
        return element ;
      }
    }
    return null ;
  }

}
