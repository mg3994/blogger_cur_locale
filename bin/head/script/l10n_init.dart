import 'package:blogger_theme/blogger_theme.dart';
import '../../locales/config.dart';

final l10nInitScript = Script(
  type: 'text/javascript',
  childrenz: [
    Text('(function() {\n'),
    Text("  var defaultLocale = '${L10nConfig.defaultLocale}';\n"),
    Text("  var defaultCurrency = '${L10nConfig.defaultCurrency}';\n"),
    Text("  var cachedLocale = localStorage.getItem('antinna-locale') || defaultLocale;\n"),
    Text("  var cachedCurrency = localStorage.getItem('antinna-currency') || defaultCurrency;\n"),
    Text("  localStorage.setItem('antinna-locale', cachedLocale);\n"),
    Text("  localStorage.setItem('antinna-currency', cachedCurrency);\n"),
    Text("  document.documentElement.setAttribute('lang', cachedLocale);\n"),
    Text("  document.documentElement.classList.add('currency-' + cachedCurrency.toLowerCase());\n"),
    Text('})();\n'),
  ],
);
