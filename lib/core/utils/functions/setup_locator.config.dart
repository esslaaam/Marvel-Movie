// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_app/core/utils/functions/register_module.dart' as _i17;
import 'package:movie_app/features/movie_details/data/data_sources/movie_details_local_data_source.dart'
    as _i6;
import 'package:movie_app/features/movie_details/data/data_sources/movie_details_remote_data_sourse.dart'
    as _i5;
import 'package:movie_app/features/movie_details/data/repos/movie_details_repos_impl.dart'
    as _i11;
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repo.dart'
    as _i10;
import 'package:movie_app/features/movie_details/domain/use_cases/fetch_movie_details_use_case.dart'
    as _i12;
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_cubit.dart'
    as _i16;
import 'package:movie_app/features/movies/data/data_sources/movies_remote_data_sourse.dart'
    as _i7;
import 'package:movie_app/features/movies/data/networking/movies_api_client.dart'
    as _i4;
import 'package:movie_app/features/movies/data/repos/movies_repos_impl.dart'
    as _i9;
import 'package:movie_app/features/movies/domain/repositories/movies_repo.dart'
    as _i8;
import 'package:movie_app/features/movies/domain/use_cases/fetch_movies_use_case.dart'
    as _i13;
import 'package:movie_app/features/movies/domain/use_cases/fetch_result_search_movies_use_case.dart'
    as _i14;
import 'package:movie_app/features/movies/presentation/cubit/movies_cubit.dart'
    as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(() => registerModule.dio);
    gh.factory<_i4.MoviesApiClient>(() => registerModule.getMoviesApiClient());
    gh.factory<_i5.MovieDetailsRemoteDataSource>(
        () => _i5.MovieDetailsRemoteDataSourceImpl());
    gh.factory<_i6.MovieDetailsLocalDataSource>(
        () => _i6.MovieDetailsLocalDataSourceImpl());
    gh.factory<_i7.MoviesRemoteDataSource>(() => _i7.MoviesRemoteDataSourceImpl(
        moviesApiClient: gh<_i4.MoviesApiClient>()));
    gh.factory<_i8.MoviesRepo>(() => _i9.MoviesReposImpl(
        moviesRemoteDataSource: gh<_i7.MoviesRemoteDataSource>()));
    gh.factory<_i10.MovieDetailsRepo>(() => _i11.MovieDetailsReposImpl(
          detailsLocalDataSource: gh<_i6.MovieDetailsLocalDataSource>(),
          detailsRemoteDataSource: gh<_i5.MovieDetailsRemoteDataSource>(),
        ));
    gh.factory<_i12.FetchMovieDetailsUseCase>(
        () => _i12.FetchMovieDetailsUseCase(gh<_i10.MovieDetailsRepo>()));
    gh.factory<_i13.FetchMoviesUseCase>(
        () => _i13.FetchMoviesUseCase(gh<_i8.MoviesRepo>()));
    gh.factory<_i14.FetchResultSearchMoviesUseCase>(
        () => _i14.FetchResultSearchMoviesUseCase(gh<_i8.MoviesRepo>()));
    gh.factory<_i15.MoviesCubit>(() => _i15.MoviesCubit(
          gh<_i13.FetchMoviesUseCase>(),
          gh<_i14.FetchResultSearchMoviesUseCase>(),
        ));
    gh.factory<_i16.MovieDetailsCubit>(
        () => _i16.MovieDetailsCubit(gh<_i12.FetchMovieDetailsUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
