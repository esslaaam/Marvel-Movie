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

  late final ScrollController scrollControllerMovies;
  late final ScrollController scrollControllerSearchMovies;

  /// Fetch Movies Pagination

  List<MovieEntity> homeMovies = [];

  bool movie = false;

  int nextPage = 1;

  bool isLoading = false;

  Future<void> fetchMovies({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(MoviesLoadingState());
    } else {
      emit(MoviesPaginationLoadingState());
    }
    var result = await fetchMoviesUseCase.call(pageNumber);
    result.fold((error) {
      if (pageNumber == 0) {
        emit(MoviesFailureState(error.message));
      } else {
        emit(MoviesPaginationFailureState(error.message));
      }
    }, (movies) {
      if (movies.isEmpty) {
        movie = true;
        showToast(text: "There are no other movies", state: ToastStates.warning);
        emit(MoviesSuccessState(movies));
      }
      homeMovies.addAll(movies);
      emit(MoviesSuccessState(movies));
    });
  }

  void pageInitMovies() {
    scrollControllerMovies = ScrollController();
    scrollControllerMovies.addListener(scrollListenerMovies);
  }

  void scrollListenerMovies() async {
    final currentPosition = scrollControllerMovies.position.pixels;
    final scrollMax = scrollControllerMovies.position.maxScrollExtent;
    final threshold = scrollMax;

    if (currentPosition >= threshold) {
      if (!isLoading) {
        isLoading = true;
        movie == false ?
        await fetchMovies(pageNumber:nextPage++)
            : debugPrint("Stop Pagination");
        isLoading = false;
      }
    }
  }



  /// Fetch Result Search Movies Pagination


  List<MovieEntity> resultSearchMovies = [];

  final searchCtrl = TextEditingController();

  bool resultSearch = false;

  bool isSearch = false;

  int nextPageSearch = 1;

  bool isLoadingSearch = false;

  Future<void> fetchResultSearchMovies({required SearchModel searchModel}) async {
    if (searchModel.pageNumber == 0) {
      resultSearch = false ;
      nextPageSearch  = 1 ;
      resultSearchMovies.clear();
      emit(MoviesSearchLoadingState());
    } else {
      emit(MoviesSearchPaginationLoadingState());
    }
    var result = await fetchResultSearchMoviesUseCase.call(searchModel);
    result.fold((error) {
      if (searchModel.pageNumber == 0) {
        emit(MoviesSearchFailureState(error.message));
      } else {
        emit(MoviesSearchPaginationFailureState(error.message));
      }
    }, (results) {
      if (searchModel.pageNumber == 0) {
        resultSearchMovies.clear();
        resultSearchMovies.addAll(results);
        emit(MoviesSearchSuccessState(results));
      } else {
        if (results.isEmpty) {
          resultSearch = true;
          showToast(text: "There are no other movies", state: ToastStates.warning);
          emit(MoviesSearchPaginationSuccessState(results));
        }
        resultSearchMovies.addAll(results);
        emit(MoviesSearchPaginationSuccessState(results));
      }
    });
  }

  void stopSearch(){
    isSearch = false ;
    emit(ChangeUi());
  }

  void playSearch(){
    isSearch = true ;
    emit(ChangeUi());
  }

  void pageInitSearchMovies() {
    scrollControllerSearchMovies = ScrollController();
    scrollControllerSearchMovies.addListener(scrollListenerSearchMovies);
  }

  void scrollListenerSearchMovies() async {
    final currentPosition = scrollControllerSearchMovies.position.pixels;
    final scrollMax = scrollControllerSearchMovies.position.maxScrollExtent;
    final threshold = scrollMax;

    if (currentPosition >= threshold) {
      if (!isLoadingSearch) {
        isLoadingSearch = true;
        resultSearch == false
            ? await fetchResultSearchMovies(searchModel: SearchModel(nextPageSearch++, searchCtrl.text))
            : debugPrint("Stop Pagination");
        isLoadingSearch = false;
      }
    }
  }








}
