import 'package:blogger_theme/blogger_theme.dart';
import '../../../../locales/app_localizations.dart';

final sidebar_l10n_area = Div(
  attributes: {'class': 'sidebar-l10n-area'},
  children: [
    Div(
      attributes: {'class': 'module-wrapper'},
      children: [
        Div(
          attributes: {
            'style': 'padding: 10px 16px; font-weight: 700; font-size: 0.75rem; text-transform: uppercase; color: var(--text-muted); letter-spacing: 0.5px;'
          },
          children: [
            Span(
              children: [AppLocalizations.current.preferencesComponent],
            ),
          ],
        ),

        // Language Select
        Div(
          attributes: {'style': 'padding: 0 16px 12px;'},
          children: [
            Span(
              attributes: {
                'style': 'font-size: 0.75rem; color: var(--text-muted); font-weight: 600;',
              },
              children: [AppLocalizations.current.language_localeComponent],
            ),
            Div(
              attributes: {
                'class': 'settings-select-box',
                'style': 'background: var(--bg-app);'
              },
              children: [
                Select(
                  attributes: {
                    'id': 'sidebar-language-selector',
                    'class': 'settings-select',
                    'onchange': 'window.setLanguage(this.value)',
                  },
                  children: [
                    Option(attributes: {'value': 'en'}, children: [Text('English (EN)')]),
                    Option(attributes: {'value': 'hi'}, children: [Text('हिन्दी (HI)')]),
                    Option(attributes: {'value': 'fr'}, children: [Text('Français (FR)')]),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Currency Select
        Div(
          attributes: {'style': 'padding: 0 16px 16px;'},
          children: [
            Span(
              attributes: {
                'style': 'font-size: 0.75rem; color: var(--text-muted); font-weight: 600;',
              },
              children: [AppLocalizations.current.preferred_currencyComponent],
            ),
            Div(
              attributes: {
                'class': 'settings-select-box',
                'style': 'background: var(--bg-app);'
              },
              children: [
                Select(
                  attributes: {
                    'id': 'sidebar-currency-selector',
                    'class': 'settings-select',
                    'onchange': 'window.setCurrency(this.value)',
                  },
                  children: [
                    Option(attributes: {'value': 'INR'}, children: [Text('INR (₹)')]),
                    Option(attributes: {'value': 'USD'}, children: [Text(r'USD ($)')]),
                    Option(attributes: {'value': 'EUR'}, children: [Text('EUR (€)')]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
