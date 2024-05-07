import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_app/features/animation/presentation/views/animation_screen.dart';
import 'package:movie_app/features/movie_details/presentation/views/movie_details_view.dart';
import 'package:movie_app/features/movies/presentation/views/movies_screen.dart';
import 'package:movie_app/features/movies/presentation/views/widget/custom_movie_item.dart';
import 'package:movie_app/features/splash/presentation/views/splash_view.dart';
import 'package:movie_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    "Go To Splash and Go To Home and Go To Movie Details",
    () {
      testWidgets(
        "End To End",
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          expect(find.byType(AnimationScreen), findsOneWidget);
          await tester.pumpAndSettle(const Duration(seconds: 2));
          expect(find.byType(MoviesScreen), findsOneWidget);
          expect(find.byKey(const Key('list_movies_home')), findsOneWidget);
          expect(find.byType(CustomMovieItem), findsWidgets);
          await tester.pump(const Duration(seconds: 2));
          expect(find.byType(CustomMovieItem).at(2), findsOneWidget);
          await tester.tap(find.byType(CustomMovieItem).at(2));
          await tester.pumpAndSettle(const Duration(seconds: 3));
          expect(find.byType(MovieDetailsView), findsOneWidget);
          expect(find.byType(MoviesScreen), findsNothing);
          await tester.pump();
        },
      );
    },
  );
}
