import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_app/features/movie_details/presentation/views/movie_details_view.dart';
import 'package:movie_app/features/movies/presentation/views/movies_screen.dart';
import 'package:movie_app/features/movies/presentation/views/widget/custom_movie_item.dart';
import 'package:movie_app/features/movies/presentation/views/widget/custom_movie_list.dart';
import 'package:movie_app/features/movies/presentation/views/widget/custom_search_form_field.dart';
import 'package:movie_app/features/movies/presentation/views/widget/list_movies.dart';
import 'package:movie_app/features/splash/presentation/views/splash_view.dart';
import 'package:movie_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    "Go To Splash and Go To Home and Go To Movie Details",
    () {
      testWidgets(
        "Integration Test",
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 1));
          expect(find.byType(SplashView), findsOneWidget);
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          expect(find.byType(MoviesScreen), findsOneWidget);
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();
          expect(find.byType(CustomSearchFormField), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.byType(CustomMovieList), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('list_movies_home')), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.byType(CustomMovieItem), findsOneWidget); // Ensure only one CustomMovieItem is found
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();
          await tester.tap(find.byType(CustomMovieItem)); // Tap on the CustomMovieItem with the specified key
          await tester.pumpAndSettle();
          expect(find.byType(MovieDetailsView), findsOneWidget);
        },
        timeout: Timeout.none,
      );
    },
  );
}
