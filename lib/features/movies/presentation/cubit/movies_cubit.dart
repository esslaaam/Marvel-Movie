import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widget/custom_toast.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/use_cases/fetch_movies_use_case.dart';
import 'package:movie_app/features/movies/domain/use_cases/fetch_result_search_movies.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final FetchMoviesUseCase fetchMoviesUseCase;
  final FetchResultSearchMoviesUseCase fetchResultSearchMoviesUseCase;

  MoviesCubit(this.fetchMoviesUseCase, this.fetchResultSearchMoviesUseCase) : super(MoviesInitial());

  /// Fetch Movies Pagination

  List<MovieEntity> homeMovies = [];

  bool movie = false;

  Future<void> fetchMovies({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(MoviesLoading());
    } else {
      emit(MoviesPaginationLoading());
    }
    var result = await fetchMoviesUseCase.call(pageNumber);
    result.fold((error) {
      if (pageNumber == 0) {
        emit(MoviesFailure(error.message));
      } else {
        emit(MoviesPaginationFailure(error.message));
      }
    }, (movies) {
      if (movies.isEmpty) {
        movie = true;
        showToast(
            text: "There are no other movies", state: ToastStates.warning);
        emit(MoviesSuccess());
      } else {
        homeMovies.addAll(movies);
        emit(MoviesSuccess());
      }
    });
  }

  late final ScrollController scrollControllerMovies;

  void pageInitMovies() {
    scrollControllerMovies = ScrollController();
    scrollControllerMovies.addListener(scrollListenerMovies);
  }

  int nextPage = 1;
  bool isLoading = false;

  void scrollListenerMovies() async {
    final currentPosition = scrollControllerMovies.position.pixels;
    final scrollMax = scrollControllerMovies.position.maxScrollExtent;
    final max = scrollMax;

    if (currentPosition == max) {
      if (!isLoading) {
        isLoading = true;
        movie == false
            ? await fetchMovies(pageNumber: nextPage++)
            : debugPrint("Stop Pagination");
        isLoading = false;
      }
    }
  }

  /// Fetch Result Search Movies Pagination

  List<MovieEntity> resultSearchMovies = [];

  final searchCtrl = TextEditingController();

  bool resultSearch = false;

  Future<void> fetchResultSearchMovies(
      {required SearchModel searchModel}) async {
    if (searchModel.pageNumber == 0) {
      resultSearch = false;
      nextPageSearch = 1;
      resultSearchMovies.clear();
      emit(MoviesSearchLoading());
    } else {
      emit(MoviesSearchPaginationLoading());
    }
    var result = await fetchResultSearchMoviesUseCase.call(searchModel);
    result.fold((error) {
      if (searchModel.pageNumber == 0) {
        emit(MoviesSearchFailure(error.message));
      } else {
        emit(MoviesSearchPaginationFailure(error.message));
      }
    }, (results) {
      if (searchModel.pageNumber == 0) {
        if (results.isNotEmpty) {
          resultSearchMovies.clear();
          resultSearchMovies.addAll(results);
          emit(MoviesSearchSuccess());
        } else {
          resultSearchMovies.clear();
          emit(MoviesSearchSuccess());
        }
      } else {
        if (results.isEmpty) {
          resultSearch = true;
          showToast(
              text: "There are no other movies", state: ToastStates.warning);
          emit(MoviesSearchPaginationSuccess());
        } else {
          resultSearchMovies.addAll(results);
          emit(MoviesSearchPaginationSuccess());
        }
      }
    });
  }

  bool isSearch = false;

  void stopSearch() {
    isSearch = false;
    emit(ChangeUi());
  }

  void playSearch() {
    isSearch = true;
    emit(ChangeUi());
  }

  void search({required String val}) {
    if (val.isEmpty) {
      stopSearch();
    } else {
      playSearch();
      emit(MoviesSearchDelayLoading());
      Future.delayed(const Duration(seconds: 2)).then((value) {
        fetchResultSearchMovies(searchModel: SearchModel(0, searchCtrl.text));
      });
    }
  }

  late final ScrollController scrollControllerSearchMovies;

  void pageInitSearchMovies() {
    scrollControllerSearchMovies = ScrollController();
    scrollControllerSearchMovies.addListener(scrollListenerSearchMovies);
  }

  int nextPageSearch = 1;
  bool isLoadingSearch = false;

  void scrollListenerSearchMovies() async {
    final currentPosition = scrollControllerSearchMovies.position.pixels;
    final scrollMax = scrollControllerSearchMovies.position.maxScrollExtent;
    final max = scrollMax;
    if (currentPosition == max) {
      if (!isLoadingSearch) {
        isLoadingSearch = true;
        resultSearch == false
            ? await fetchResultSearchMovies(
                searchModel: SearchModel(nextPageSearch++, searchCtrl.text))
            : debugPrint("Stop Pagination");
        isLoadingSearch = false;
      }
    }
  }
}
