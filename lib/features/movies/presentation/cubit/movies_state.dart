part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}
/// List Movies
class MoviesInitial extends MoviesState {}
class ChangeUi extends MoviesState {}
class MoviesLoadingState extends MoviesState {}
class MoviesPaginationLoadingState extends MoviesState {}
class MoviesPaginationFailureState extends MoviesState {
  final String errMessage ;

  MoviesPaginationFailureState(this.errMessage);
}
class MoviesFailureState extends MoviesState {
  final String errMsg;

  MoviesFailureState(this.errMsg);
}
class MoviesSuccessState extends MoviesState {
  final List<MovieEntity> movies;

  MoviesSuccessState(this.movies);
}
/// Search Movies
class MoviesSearchLoadingState extends MoviesState {}
class MoviesSearchPaginationLoadingState extends MoviesState {}
class MoviesSearchPaginationFailureState extends MoviesState {
  final String errMessage ;

  MoviesSearchPaginationFailureState(this.errMessage);
}
class MoviesSearchFailureState extends MoviesState {
  final String errMsg;

  MoviesSearchFailureState(this.errMsg);
}
class MoviesSearchSuccessState extends MoviesState {
  final List<MovieEntity> resultMovies;

  MoviesSearchSuccessState(this.resultMovies);
}
class MoviesSearchPaginationSuccessState extends MoviesState {
  final List<MovieEntity> resultMovies;

  MoviesSearchPaginationSuccessState(this.resultMovies);
}
