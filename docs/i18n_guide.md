# 🌍 Antinna Blogger Theme Internationalization (i18n) Guide

This guide details the complete, production-grade internationalization (i18n) framework designed for type-safe theme authoring and rich, locale-aware web formatting.

---

## 🚀 1. The Design: AppInternationalization (`AppI18n`)

The theme automatically implements compile-time generation of type-safe localization files. Each string declared in the ARB files is compiled into two formats on `AppI18n.current`:
1. **Raw Static `String` translation:** `AppI18n.current.key_name`
   - Returns a compiled string.
2. **Dynamic self-translating `Component` wrapper:** `AppI18n.current.key_nameComponent`
   - Returns a custom React-like `I18nText` component that automatically localizes on the client-side upon switches with zero flickering.

---

## 🛠️ 2. Client-side JavaScript API (`window.AppI18n`)

A powerful i18n controller is injected into the window context supporting standard ICU formatting:

### 1. ICU Messages & Pluralization Rules
- Handles simple placeholders: `welcome_message({ name: "Manish" })` -> `"Hello Manish"`.
- Supports full ICU plural rules recursively using browser plural classifiers:
  `"{count, plural, =0{No items} =1{One item} other{{count} items}}"`

### 2. Financial & Currency Formatting (`formatCurrency`)
- Auto symbol placement based on the user's active locale and cultural expectations:
  `formatCurrency(100, 'USD')` -> `"$100.00"` for English, `"100,00 $"` for French.

### 3. Number, Percentage & Scientific Formatting
- `formatDecimal(val, fractionDigits)`: locale-aware decimals (e.g. `12,345.67` vs `12.345,67`).
- `formatCompact(val)`: compact numbers (e.g., `1.2K`, `1.5M`).
- `formatPercent(val)`: localized percentages (e.g. `25%`).
- `formatScientific(val)`: localized scientific notation.

### 4. Date & Time Skeletons
- `formatDate(date, options)`: formats dates according to locale-specific standards.
- `formatTime(date, use24Hour)`: localized 12-hour or 24-hour clocks.
- `formatRelativeTime(val, unit)`: formats relative date/time offsets (e.g. `formatRelativeTime(-1, 'day')` -> `"yesterday"` / `"कल"` / `"hier"`).

### 5. Layout Direction (RTL)
- Automatically sets `dir="rtl"` on `document.documentElement` if an RTL locale is selected.
