import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

/// Generates the client-side JavaScript localization dictionary and helpers.
String generateL10nScript() {
  final l10nDir = Directory('l10n');
  final Map<String, Map<String, String>> dictionary = {};

  if (l10nDir.existsSync()) {
    final files = l10nDir.listSync().whereType<File>();
    for (final file in files) {
      final name = p.basename(file.path);
      if (name.endsWith('.arb')) {
        try {
          final content = file.readAsStringSync();
          final data = json.decode(content);
          if (data is Map) {
            final locale = data['@@locale'] ?? name.replaceAll('intl_', '').replaceAll('.arb', '');
            final Map<String, String> translations = {};
            for (final entry in data.entries) {
              final key = entry.key;
              final value = entry.value;
              if (!key.startsWith('@') && value is String) {
                translations[key] = value;
              }
            }
            dictionary[locale] = translations;
          }
        } catch (e) {
          print('Warning: Failed to parse ARB file ${file.path}: $e');
        }
      }
    }
  }

  // Ensure 'en' fallback is present if dictionary is empty
  if (dictionary.isEmpty) {
    dictionary['en'] = {
      'session_settings': 'Session Settings',
    };
  }

  final dictionaryJson = json.encode(dictionary);

  return '''
(function() {
  const l10nDictionary = $dictionaryJson;

  window.translateDOM = function() {
    const currentLocale = localStorage.getItem('antinna-locale') || 'en';
    const dict = l10nDictionary[currentLocale] || l10nDictionary['en'] || {};

    // 1. Translate elements with data-l10n
    document.querySelectorAll('[data-l10n]').forEach(el => {
      const key = el.getAttribute('data-l10n');
      if (dict[key]) {
        if (el.textContent !== dict[key]) {
          el.textContent = dict[key];
        }
      }
    });

    // 2. Translate placeholders with data-l10n-placeholder
    document.querySelectorAll('[data-l10n-placeholder]').forEach(el => {
      const key = el.getAttribute('data-l10n-placeholder');
      if (dict[key]) {
        if (el.getAttribute('placeholder') !== dict[key]) {
          el.setAttribute('placeholder', dict[key]);
        }
      }
    });

    // 3. Sync language selector values (both modal and sidebar)
    const langSelectors = ['language-selector', 'sidebar-language-selector'];
    langSelectors.forEach(id => {
      const select = document.getElementById(id);
      if (select && select.value !== currentLocale) {
        select.value = currentLocale;
      }
    });

    // 4. Sync currency selector values (both modal and sidebar)
    const currentCurrency = localStorage.getItem('antinna-currency') || 'INR';
    const currSelectors = ['currency-selector', 'sidebar-currency-selector'];
    currSelectors.forEach(id => {
      const select = document.getElementById(id);
      if (select && select.value !== currentCurrency) {
        select.value = currentCurrency;
      }
    });
  };

  window.setLanguage = function(lang) {
    localStorage.setItem('antinna-locale', lang);
    document.documentElement.setAttribute('lang', lang);
    window.translateDOM();
  };

  window.setCurrency = function(curr) {
    localStorage.setItem('antinna-currency', curr);
    const htmlEl = document.documentElement;

    // Clean old currency classes
    const classesToRemove = [];
    htmlEl.classList.forEach(cls => {
      if (cls.startsWith('currency-')) {
        classesToRemove.push(cls);
      }
    });
    classesToRemove.forEach(cls => htmlEl.classList.remove(cls));

    htmlEl.classList.add('currency-' + curr.toLowerCase());

    if (window.updatePrices) {
      window.updatePrices();
    }
  };

  // Run on DOMContentLoaded and observe future mutations
  document.addEventListener('DOMContentLoaded', () => {
    window.translateDOM();
    if (window.updatePrices) {
      window.updatePrices();
    }

    const observer = new MutationObserver(() => {
      window.translateDOM();
      if (window.updatePrices) {
        window.updatePrices();
      }
    });
    observer.observe(document.body, { childList: true, subtree: true });
  });
})();
''';
}
