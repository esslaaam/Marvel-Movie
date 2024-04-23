import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/constants.dart';
import 'core/utils/functions/setup_locator.dart';
import 'features/splash/presentation/views/splash_view.dart';

/// flutter packages pub run build_runner build ===> TO GENERATE TYPE ADAPTER
/// Timer Pagination
/// Search + List Movies One List

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieDetailsEntityAdapter());
  await Hive.openBox<MovieDetailsEntity>(kMovieDetailsBox);
  Bloc.observer = MyBlocObserver();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) => MaterialApp(
        title: 'Marvel Movie',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          fontFamily: kAlmarai,
          scaffoldBackgroundColor: AppColors.kPrimary,
          useMaterial3: true,
        ),
        home: child,
      ),
      child: const SplashView(),
    );
  }
}
