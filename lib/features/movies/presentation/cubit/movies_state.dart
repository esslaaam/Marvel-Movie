part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}
/// List Movies
class MoviesInitial extends MoviesState {}
class ChangeUi extends MoviesState {}
class MoviesLoading extends MoviesState {}
class MoviesPaginationLoading extends MoviesState {}
class MoviesPaginationFailure extends MoviesState {
  final String errMsg ;
  MoviesPaginationFailure(this.errMsg);
}
class MoviesFailure extends MoviesState {
  final String errMsg;
  MoviesFailure(this.errMsg);
}
class MoviesSuccess extends MoviesState {}
/// Search Movies
class MoviesSearchLoading extends MoviesState {}
class MoviesSearchDelayLoading extends MoviesState {}
class MoviesSearchPaginationLoading extends MoviesState {}
class MoviesSearchPaginationFailure extends MoviesState {
  final String errMsg ;
  MoviesSearchPaginationFailure(this.errMsg);
}
class MoviesSearchFailure extends MoviesState {
  final String errMsg;
  MoviesSearchFailure(this.errMsg);
}
class MoviesSearchSuccess extends MoviesState {}

class MoviesSearchPaginationSuccess extends MoviesState {}
