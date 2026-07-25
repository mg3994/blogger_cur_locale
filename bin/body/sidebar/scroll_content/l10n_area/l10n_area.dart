import 'package:blogger_theme/blogger_theme.dart';

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
              attributes: {'data-l10n': 'preferences'},
              children: [Text('Preferences')],
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
                'data-l10n': 'language_locale'
              },
              children: [Text('Language & Locale')],
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
                'data-l10n': 'preferred_currency'
              },
              children: [Text('Preferred Currency')],
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
