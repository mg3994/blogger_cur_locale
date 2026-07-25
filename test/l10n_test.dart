import 'package:test/test.dart';
import '../bin/locales/config.dart';
import '../bin/locales/l10n_generator.dart';

void main() {
  group('Blogger Theme Internationalization Tests', () {
    test('Default values configuration is defined correctly', () {
      expect(L10nConfig.defaultLocale, equals('en'));
      expect(L10nConfig.fallbackLocale, equals('en'));
      expect(L10nConfig.defaultCurrency, equals('INR'));
      expect(L10nConfig.fallbackCurrency, equals('INR'));
      expect(L10nConfig.supportedLocales, equals(['en', 'hi', 'fr']));
      expect(L10nConfig.supportedCurrencies, equals(['INR', 'USD', 'EUR']));
      expect(L10nConfig.currencySymbols, equals({
        'INR': '₹',
        'USD': r'$',
        'EUR': '€',
      }));
    });

    test('L10n Generator parses ARB files and produces JavaScript dictionary', () {
      final jsScript = generateL10nScript();

      // Ensure that all three supported locales are present in the compiled JSON dictionary
      expect(jsScript, contains('"en"'));
      expect(jsScript, contains('"hi"'));
      expect(jsScript, contains('"fr"'));

      // Ensure that translated keys are present
      expect(jsScript, contains('"session_settings"'));
      expect(jsScript, contains('"preferred_currency"'));
      expect(jsScript, contains('"logout_session"'));
      expect(jsScript, contains('"preferences"'));

      // Ensure specific translations exist
      expect(jsScript, contains('सत्र सेटिंग्स')); // Hindi translation for session_settings
      expect(jsScript, contains('प्राथमिकताएं')); // Hindi translation for preferences
      expect(jsScript, contains('Paramètres de session')); // French translation for session_settings
      expect(jsScript, contains('Préférences')); // French translation for preferences

      // Ensure translation helpers are declared
      expect(jsScript, contains('window.translateDOM = function()'));
      expect(jsScript, contains('window.setLanguage = function(lang)'));
      expect(jsScript, contains('window.setCurrency = function(curr)'));
    });
  });
}
