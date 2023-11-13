part of 'movie_details_cubit.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}
class MovieDetailsLoadingState extends MovieDetailsState {}
class MovieDetailsFailureState extends MovieDetailsState {
  final String errMsg ;

  MovieDetailsFailureState(this.errMsg);
}
class MovieDetailsSuccessState extends MovieDetailsState {
  final MovieDetailsEntity movieDetails ;

  MovieDetailsSuccessState(this.movieDetails);
}
