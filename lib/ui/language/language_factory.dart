import 'package:jac/ui/language/base_language.dart';
import 'package:jac/ui/language/languages_availables/spanish_latam.dart';

class LanguageFactory {
  static final BaseLanguage _language = SpanishLatam();

  static BaseLanguage getCurrentLanguage () => _language;
}