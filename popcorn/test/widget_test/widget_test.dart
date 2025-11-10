import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popcorn/ui/generic_error_screen.dart';
import 'package:popcorn/ui/movie_cover.dart';

import '../golden_test/config/test_config.dart';

void main() {
  group("Movie Cover", () {
    testWidgets('Display placeholder when path is null', (tester) async {
      await tester.pumpWidget(
        getTestApp(
          MovieCover(path: null, placeholder: 'images/poster_placeholder.png'),
        ),
      );
      await tester.pumpAndSettle();
      final placeHolder = find.byType(Image);
      expect(placeHolder, findsOneWidget);
    });

    testWidgets('Display FadeImage when path is not null', (tester) async {
      await tester.pumpWidget(
        getTestApp(
          MovieCover(
            path: '/path.png',
            placeholder: 'images/poster_placeholder.png',
          ),
        ),
      );
      await tester.pumpAndSettle();
      final image = find.byType(FadeInImage);
      expect(image, findsOneWidget);
    });

    testWidgets('Generic Error', (tester) async {
      final genericError = GenericErrorScreen(onRetry: () {});
      await tester.pumpWidget(getTestApp(genericError));
      await tester.pumpAndSettle();

      final titleText = find.text('Something went wrong please try again...');
      expect(titleText, findsOneWidget);

      final retryButton = find.byType(ElevatedButton);
      expect(retryButton, findsOneWidget);
    });
  });
}
