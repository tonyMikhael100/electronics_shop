# Localization Implementation for Electronics Shop

This document explains how the localization system has been implemented in the Electronics Shop Flutter app with Arabic (Egyptian Arabic) support.

## Features Implemented

✅ **Language Support**: English and Arabic (Egyptian Arabic)
✅ **Persistent Language Storage**: Language preference saved in SharedPreferences
✅ **Language Toggle**: Easy language switching in Profile view
✅ **RTL Support**: Automatic right-to-left layout for Arabic
✅ **Cubit State Management**: Clean state management for language changes

## Files Added/Modified

### New Files Created:
- `lib/l10n/app_en.arb` - English translations
- `lib/l10n/app_ar.arb` - Arabic translations
- `lib/core/localization/cubit/localization_cubit.dart` - Language state management
- `lib/core/localization/cubit/localization_state.dart` - Localization states
- `lib/core/localization/widgets/language_selection_dialog.dart` - Language picker dialog
- `l10n.yaml` - Localization configuration

### Modified Files:
- `pubspec.yaml` - Added localization dependencies
- `lib/main.dart` - Added LocalizationCubit and MaterialApp localization setup
- `lib/features/home/presentation/views/profile_view.dart` - Added language toggle functionality
- `lib/features/home/presentation/views/main_view.dart` - Example of localized greeting

## How to Use Localization

### 1. Basic Usage in Widgets

```dart
import 'package:electronics_shop/core/localization/cubit/localization_cubit.dart';

// In your widget build method:
BlocBuilder<LocalizationCubit, LocalizationState>(
  builder: (context, state) {
    final localizationCubit = context.read<LocalizationCubit>();
    return Text(
      localizationCubit.isArabic ? 'مرحبا' : 'Hello',
    );
  },
)
```

### 2. Language Toggle

The language can be changed through:
- **Profile View**: Tap on "Language" option to open selection dialog
- **Programmatically**: 
  ```dart
  context.read<LocalizationCubit>().changeLanguage('ar'); // Switch to Arabic
  context.read<LocalizationCubit>().changeLanguage('en'); // Switch to English
  context.read<LocalizationCubit>().toggleLanguage(); // Toggle between languages
  ```

### 3. Adding New Translations

1. Add the key-value pair to both `lib/l10n/app_en.arb` and `lib/l10n/app_ar.arb`
2. Run `flutter gen-l10n` to regenerate localization files
3. Use the translation in your widgets

Example:
```json
// app_en.arb
{
  "welcome": "Welcome"
}

// app_ar.arb  
{
  "welcome": "أهلاً وسهلاً"
}
```

### 4. Checking Current Language

```dart
final localizationCubit = context.read<LocalizationCubit>();

if (localizationCubit.isArabic) {
  // Arabic-specific logic
} else if (localizationCubit.isEnglish) {
  // English-specific logic
}

// Get current locale
Locale currentLocale = localizationCubit.currentLocale;
```

## Language Persistence

The selected language is automatically saved to SharedPreferences and restored when the app restarts. No additional code is needed for persistence.

## RTL Support

The app automatically switches to right-to-left layout when Arabic is selected, thanks to Flutter's built-in RTL support and the proper localization setup.

## Dependencies Added

- `flutter_localizations: sdk: flutter`
- `intl: ^0.20.2`
- `shared_preferences: ^2.3.3`

## Current Translations

The following strings have been translated:
- Profile screen (Profile, General Settings, My orders, Language, Wishlist, About us, Log out)
- Basic app navigation terms
- Common UI elements (Home, Categories, Cart, Favourite, Search, etc.)
- Shopping terms (Add to Cart, Buy Now, Price, Quantity, Total, etc.)
- Authentication terms (Sign In, Sign Up, Email, Password, etc.)

## Next Steps

To extend localization to the entire app:

1. **Add more translations** to the ARB files for all remaining UI text
2. **Update existing widgets** to use the localization system instead of hardcoded strings
3. **Consider using flutter_gen** for type-safe access to translations
4. **Add more languages** by creating additional ARB files (e.g., `app_fr.arb` for French)

## Testing

Test the localization by:
1. Running the app
2. Going to Profile → Language
3. Selecting Arabic to see the interface switch to Arabic
4. Restarting the app to verify language persistence
5. Checking that RTL layout works correctly in Arabic mode
