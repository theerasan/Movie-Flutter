// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'Popcorn';

  @override
  String get search => 'Search... ';

  @override
  String get movie_detail_cast => 'Cast';

  @override
  String get movie_detail_overview => 'Overview';

  @override
  String get general_error_message =>
      'Something went wrong please try again...';

  @override
  String get general_error_button => 'Retry';

  @override
  String get empty_movie_list => 'There is no movie to show...';
}
