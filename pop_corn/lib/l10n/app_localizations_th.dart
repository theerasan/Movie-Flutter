// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get app_name => 'ป๊อปคอร์น';

  @override
  String get search => 'ค้นหา...';

  @override
  String get movie_detail_cast => 'นักแสดง';

  @override
  String get movie_detail_overview => 'เรื่องย่อ';

  @override
  String get general_error_message => 'มีบางอย่างผิดพลาดโปรดลองอีกครั้ง...';

  @override
  String get general_error_button => 'ลองอีกครั้ง';

  @override
  String get empty_movie_list => 'ไม่มีภาพยนต์ที่ค้นหา...';
}
