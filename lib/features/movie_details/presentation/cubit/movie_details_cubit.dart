import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/features/movie_details/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:flutter/material.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;

  MovieDetailsCubit(this.fetchMovieDetailsUseCase)
      : super(MovieDetailsInitial());

  /// Fetch Movie Details
  MovieDetailsEntity? details;

  Future<void> fetchMovieDetails({required int id}) async {
    emit(MovieDetailsLoadingState());
    var result = await fetchMovieDetailsUseCase.call(id);
    result.fold((error) {
      emit(MovieDetailsFailureState(error.message));
    }, (movieDetails) {
      details = movieDetails;
      emit(MovieDetailsSuccessState(movieDetails));
    });
  }
}
