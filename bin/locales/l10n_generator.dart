import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'config.dart';

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

            // Only process if it is in our configured supported locales list
            if (L10nConfig.supportedLocales.contains(locale)) {
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
          }
        } catch (e) {
          print('Warning: Failed to parse ARB file ${file.path}: $e');
        }
      }
    }
  }

  // Ensure default/fallback locale is present in dictionary
  if (dictionary.isEmpty) {
    dictionary[L10nConfig.fallbackLocale] = {
      'session_settings': 'Session Settings',
    };
  }

  final dictionaryJson = json.encode(dictionary);
  final currencySymbolsJson = json.encode(L10nConfig.currencySymbols);

  return '''
(function() {
  const l10nDictionary = $dictionaryJson;

  // Global Localization & Currency Helper for Dynamic Post JSON-LD Schemas
  window.AntinnaL10nHelper = {
    getLocale: function() {
      return localStorage.getItem('antinna-locale') || '${L10nConfig.defaultLocale}';
    },

    getCurrency: function() {
      return localStorage.getItem('antinna-currency') || '${L10nConfig.defaultCurrency}';
    },

    getLocalizedValue: function(obj, fallbackKey = '${L10nConfig.fallbackLocale}') {
      if (!obj) return '';
      if (typeof obj === 'string') return obj;
      const locale = this.getLocale();
      return obj[locale] || obj[fallbackKey] || Object.values(obj)[0] || '';
    },

    getLocalizedKeywords: function(schema) {
      if (!schema || !schema.keywords) return [];
      const locale = this.getLocale();
      return schema.keywords[locale] || schema.keywords['${L10nConfig.fallbackLocale}'] || [];
    },

    getLocalizedPageName: function(schema, pageUrl) {
      if (!schema || !schema.pages || !schema.pages[pageUrl]) return '';
      const page = schema.pages[pageUrl];
      return this.getLocalizedValue(page.name);
    },

    getPriceSpecifications: function(schema) {
      const offer = schema.makesOffer || schema;
      if (!offer || !offer.priceSpecification) return [];
      const currency = this.getCurrency();
      return offer.priceSpecification[currency] || [];
    },

    getShippingDetails: function(schema) {
      const offer = schema.makesOffer || schema;
      if (!offer || !offer.shippingDetails) return [];

      const currency = this.getCurrency();
      const prefixMap = {
        'USD': 'US',
        'INR': 'IN',
        'EUR': 'FR'
      };
      const prefix = prefixMap[currency] || 'IN';

      const details = [];
      for (const [key, val] of Object.entries(offer.shippingDetails)) {
        if (key.startsWith(prefix)) {
          if (Array.isArray(val)) {
            details.push(...val);
          } else {
            details.push(val);
          }
        }
      }
      return details;
    },

    formatPrice: function(price, currency = null) {
      const curr = currency || this.getCurrency();
      const symbols = $currencySymbolsJson;
      const sym = symbols[curr] || '';
      return sym + price;
    }
  };

  window.translateDOM = function() {
    const currentLocale = localStorage.getItem('antinna-locale') || '${L10nConfig.defaultLocale}';
    const dict = l10nDictionary[currentLocale] || l10nDictionary['${L10nConfig.fallbackLocale}'] || {};

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
    const currentCurrency = localStorage.getItem('antinna-currency') || '${L10nConfig.defaultCurrency}';
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

  window.updatePrices = function() {
    // Left customizable for you to handle Blog1 content dynamically as you prefer!
    if (typeof window.onCurrencyOrLocaleChange === 'function') {
      window.onCurrencyOrLocaleChange();
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
