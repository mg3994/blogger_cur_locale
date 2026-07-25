class L10nConfig {
  /// The default locale for the theme.
  static const String defaultLocale = 'en';

  /// The fallback locale if a translation is missing.
  static const String fallbackLocale = 'en';

  /// The default currency for the theme.
  static const String defaultCurrency = 'INR';

  /// The fallback currency if a currency specification is missing.
  static const String fallbackCurrency = 'INR';

  /// The list of supported locales in the theme.
  static const List<String> supportedLocales = ['en', 'hi', 'fr'];

  /// The list of supported currencies in the theme.
  static const List<String> supportedCurrencies = ['INR', 'USD', 'EUR'];

  /// The mapping of currency ISO strings to their respective symbols.
  static const Map<String, String> currencySymbols = {
    'INR': '₹',
    'USD': r'$',
    'EUR': '€',
  };
}
