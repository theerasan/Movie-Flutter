import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:popcorn/config/dependencies.dart';
import 'package:popcorn/main.dart';
import 'package:popcorn/presentation/movie_detail/movie_detail_cast.dart';
import 'package:popcorn/presentation/movie_detail/movie_detail_screen.dart';
import 'package:popcorn/presentation/movie_list/movie_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('name', (tester) async {
    await tester.pumpWidget(MultiProvider(providers: providersLocal, child: const PopcornApp()));

    await tester.pumpAndSettle();
    expect(find.byType(MovieListScreen), findsOneWidget);
    await tester.tap(find.text('Afterburn'));
    await tester.pumpAndSettle();

    expect(find.byType(MovieDetailScreen), findsOneWidget);
    expect(find.text('Weapons'), findsOneWidget);
    expect(find.byType(MovieDetailCast), findsWidgets);
  });
}