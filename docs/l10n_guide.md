# 🌍 Antinna Blogger Theme Internationalization (i18n) & Localization (l10n) Guide

This guide explains how to author dynamic, multi-language, and multi-currency blog posts using JSON-LD, and how the theme's built-in client-side helpers parse and render them reactively based on user preferences.

---

## 🚀 1. The Post Content Schema (JSON-LD)

To support multiple locales and currencies, each blog post body must contain a `<script type="application/ld+json">` with structural metadata supporting language maps and currency indices.

Below is the standard, battle-tested schema format for a product or service post:

```json
{
  "@context": {
    "@vocab": "https://schema.org/",
    "name": {
      "@container": "@language"
    },
    "keywords": {
      "@container": "@language",
      "@set": true
    },
    "pages": {
      "@container": "@id"
    },
    "priceSpecification": {
      "@container": "@index"
    },
    "shippingDetails": {
      "@container": "@index"
    }
  },
  "@type": "LocalBusiness",
  "@id": "https://antinna.com/#business",
  "name": {
    "en": "Antinna Plumbing & Services",
    "hi": "एंटिन्ना प्लंबिंग एवं सर्विसेज",
    "fr": "Antinna Plomberie et Services"
  },
  "keywords": {
    "en": ["plumbing", "pipe repair", "drain cleaning"],
    "hi": ["प्लंबिंग", "पाइप मरम्मत", "नाली सफाई"],
    "fr": ["plomberie", "réparation de tuyaux", "débouchage"]
  },
  "author": {
    "@type": "Person",
    "@id": "https://antinna.com/#founder",
    "name": {
      "en": "Manish",
      "hi": "मनीष",
      "fr": "Manish"
    }
  },
  "pages": {
    "https://antinna.com/services": {
      "name": {
        "en": "Services & Booking",
        "hi": "सेवाएं और बुकिंग",
        "fr": "Services et Réservation"
      }
    },
    "https://antinna.com/contact": {
      "name": {
        "en": "Contact Support",
        "hi": "संपर्क सहायता",
        "fr": "Support de Contact"
      }
    }
  },
  "makesOffer": {
    "@type": "Offer",
    "@id": "https://antinna.com/services/#offer",
    "availability": "https://schema.org/InStock",
    "priceSpecification": {
      "USD": [
        {
          "@type": "UnitPriceSpecification",
          "price": 20,
          "priceCurrency": "USD",
          "eligibleQuantity": {
            "@type": "QuantitativeValue",
            "minValue": 1,
            "maxValue": 4,
            "unitCode": "C62"
          }
        },
        {
          "@type": "UnitPriceSpecification",
          "price": 15,
          "priceCurrency": "USD",
          "eligibleQuantity": {
            "@type": "QuantitativeValue",
            "minValue": 5,
            "unitCode": "C62"
          }
        }
      ],
      "EUR": [
        {
          "@type": "UnitPriceSpecification",
          "price": 18,
          "priceCurrency": "EUR",
          "eligibleQuantity": {
            "@type": "QuantitativeValue",
            "minValue": 1,
            "maxValue": 4,
            "unitCode": "C62"
          }
        },
        {
          "@type": "UnitPriceSpecification",
          "price": 13.5,
          "priceCurrency": "EUR",
          "eligibleQuantity": {
            "@type": "QuantitativeValue",
            "minValue": 5,
            "unitCode": "C62"
          }
        }
      ],
      "INR": [
        {
          "@type": "UnitPriceSpecification",
          "price": 1500,
          "priceCurrency": "INR",
          "eligibleQuantity": {
            "@type": "QuantitativeValue",
            "minValue": 1,
            "maxValue": 4,
            "unitCode": "C62"
          }
        },
        {
          "@type": "UnitPriceSpecification",
          "price": 1100,
          "priceCurrency": "INR",
          "eligibleQuantity": {
            "@type": "QuantitativeValue",
            "minValue": 5,
            "unitCode": "C62"
          }
        }
      ]
    },
    "shippingDetails": {
      "US-2": [
        {
          "@type": "OfferShippingDetails",
          "shippingDestination": {
            "@type": "DefinedRegion",
            "addressCountry": "US"
          },
          "shippingRate": {
            "@type": "MonetaryAmount",
            "value": 10,
            "currency": "USD"
          }
        }
      ],
      "IN-2": [
        {
          "@type": "OfferShippingDetails",
          "shippingDestination": {
            "@type": "DefinedRegion",
            "addressCountry": "IN"
          },
          "shippingRate": {
            "@type": "MonetaryAmount",
            "value": 200,
            "currency": "INR"
          }
        }
      ],
      "FR-2": [
        {
          "@type": "OfferShippingDetails",
          "shippingDestination": {
            "@type": "DefinedRegion",
            "addressCountry": "FR"
          },
          "shippingRate": {
            "@type": "MonetaryAmount",
            "value": 8,
            "currency": "EUR"
          }
        }
      ]
    }
  },
  "mainEntity": {
    "@context": {
      "@propagate": false,
      "title": "https://schema.org/headline"
    },
    "@type": "Article",
    "title": "How to Fix Emergency Pipe Leaks",
    "description": "Quick solutions for household plumbing issues before a plumber arrives."
  }
}
```

---

## 🛠️ 2. JavaScript Helper API (`window.AntinnaL10nHelper`)

The theme automatically injects a global helper class `AntinnaL10nHelper` containing fully-optimized methods to extract and format localized post content:

### 1. `getLocale()`
* **Returns:** String (the active locale, e.g. `'en'`, `'hi'`, or `'fr'`).

### 2. `getCurrency()`
* **Returns:** String (the active currency code, e.g. `'INR'`, `'USD'`, or `'EUR'`).

### 3. `getLocalizedValue(obj, fallbackKey)`
* **Usage:** Extracts the text value matching the user's active locale.
* **Example:**
  ```javascript
  const titleObj = { "en": "Services", "hi": "सेवाएं" };
  const localizedTitle = AntinnaL10nHelper.getLocalizedValue(titleObj);
  // Returns "सेवाएं" when Hindi is selected!
  ```

### 4. `getLocalizedKeywords(schema)`
* **Returns:** Array of localized keywords based on selected locale.

### 5. `getPriceSpecifications(schema)`
* **Returns:** Array of price tier specifications matching the active currency (e.g. returns `INR` price specifications list when `INR` is selected).

### 6. `getShippingDetails(schema)`
* **Returns:** List of shipping detail options mapped dynamically to the matching currency regions (e.g., matching region keys starting with `US` for `USD` currency, `IN` for `INR`, or `FR` for `EUR`).

### 7. `formatPrice(amount, currency)`
* **Returns:** Formatted string with its currency symbol (e.g., `formatPrice(1500, 'INR')` -> `"₹1500"`, `formatPrice(20, 'USD')` -> `"$20"`).

---

## 🎨 3. Custom Post Render Customization

Instead of enforcing an automatic rendering structure on `Blog1` post elements, the localization system provides:
1. **Dynamic Theme Accent Switch:** Custom classes (`currency-usd`, `currency-eur`, `currency-inr`) are instantly set on `document.documentElement` to let you style the theme dynamically.
2. **`updatePrices` Callback hook:** A blank placeholder function `window.updatePrices` is called automatically upon changes, letting you programmatically select, parse, and render elements as you see fit! E.g.:
   ```javascript
   window.updatePrices = function() {
     // Implement your own custom DOM rendering logic for Blog1 post items here!
     // You can easily use 'window.AntinnaL10nHelper' APIs to help!
   };
   ```
3. **Automatic UI translations:** Translation variables for the core theme elements (like modal headers, drawers, buttons) containing `data-l10n` are managed automatically.
