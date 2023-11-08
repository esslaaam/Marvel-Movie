import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/constants.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      builder: (context, child) => MaterialApp(
        title: 'Marvel Movie',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          fontFamily: kAlmarai,
          scaffoldBackgroundColor: Colors.black12,
          useMaterial3: true,
        ),
        home: child,
      ),
      child: const SplashView(),
    );
  }
}

