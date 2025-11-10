import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pop_corn/config/dependencies.dart';
import 'package:pop_corn/main.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_cast.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_screen.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_screen.dart';
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