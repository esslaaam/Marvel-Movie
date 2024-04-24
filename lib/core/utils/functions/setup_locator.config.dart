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
import 'package:movie_app/core/utils/functions/register_module.dart' as _i11;
import 'package:movie_app/features/movies/data/data_sources/movies_remote_data_sourse.dart'
    as _i5;
import 'package:movie_app/features/movies/data/networking/movies_api_client.dart'
    as _i4;
import 'package:movie_app/features/movies/data/repos/movies_repos_impl.dart'
    as _i7;
import 'package:movie_app/features/movies/domain/repositories/movies_repo.dart'
    as _i6;
import 'package:movie_app/features/movies/domain/use_cases/fetch_movies_use_case.dart'
    as _i8;
import 'package:movie_app/features/movies/domain/use_cases/fetch_result_search_movies_use_case.dart'
    as _i9;
import 'package:movie_app/features/movies/presentation/cubit/movies_cubit.dart'
    as _i10;

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
    gh.factory<_i5.MoviesRemoteDataSource>(() => _i5.MoviesRemoteDataSourceImpl(
        moviesApiClient: gh<_i4.MoviesApiClient>()));
    gh.factory<_i6.MoviesRepo>(() => _i7.MoviesReposImpl(
        moviesRemoteDataSource: gh<_i5.MoviesRemoteDataSource>()));
    gh.factory<_i8.FetchMoviesUseCase>(
        () => _i8.FetchMoviesUseCase(gh<_i6.MoviesRepo>()));
    gh.factory<_i9.FetchResultSearchMoviesUseCase>(
        () => _i9.FetchResultSearchMoviesUseCase(gh<_i6.MoviesRepo>()));
    gh.factory<_i10.MoviesCubit>(() => _i10.MoviesCubit(
          gh<_i8.FetchMoviesUseCase>(),
          gh<_i9.FetchResultSearchMoviesUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
