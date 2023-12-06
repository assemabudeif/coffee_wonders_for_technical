import 'package:coffee_wonders_for_technical/l10n/ar_translations.dart';
import 'package:get/get.dart';

import 'en_translations.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enTranslations,
        'ar': arTranslations,
      };
}
