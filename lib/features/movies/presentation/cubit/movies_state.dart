part of 'movies_cubit.dart';

@immutable
abstract class MoviesState extends Equatable {
  const MoviesState();
}

/// List Movies
class MoviesInitial extends MoviesState {
  @override
  List<Object> get props => [];
}

class ChangeUi extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesPaginationLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesPaginationFailure extends MoviesState {
  final String errMsg;

  const MoviesPaginationFailure(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}

class MoviesFailure extends MoviesState {
  final String errMsg;

  const MoviesFailure(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}

class MoviesSuccess extends MoviesState {
  @override
  List<Object> get props => [];
}

/// Search Movies
class MoviesSearchLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesSearchDelayLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesSearchPaginationLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesSearchPaginationFailure extends MoviesState {
  final String errMsg;

  const MoviesSearchPaginationFailure(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}

class MoviesSearchFailure extends MoviesState {
  final String errMsg;

  const MoviesSearchFailure(this.errMsg);

  @override
  List<Object> get props => [
        errMsg,
      ];
}

class MoviesSearchSuccess extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesSearchPaginationSuccess extends MoviesState {
  @override
  List<Object> get props => [];
}
