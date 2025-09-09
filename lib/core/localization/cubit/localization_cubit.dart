import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial()) {
    _loadSavedLanguage();
  }

  static const String _languageKey = 'selected_language';
  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  Future<void> _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString(_languageKey);

      if (savedLanguage != null) {
        _currentLocale = Locale(savedLanguage);
        emit(LocalizationChanged(_currentLocale));
      } else {
        // Default to English if no saved language
        _currentLocale = const Locale('en');
        emit(LocalizationChanged(_currentLocale));
      }
    } catch (e) {
      // If there's an error, default to English
      _currentLocale = const Locale('en');
      emit(LocalizationChanged(_currentLocale));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, languageCode);

      _currentLocale = Locale(languageCode);
      emit(LocalizationChanged(_currentLocale));
    } catch (e) {
      emit(LocalizationError('Failed to change language'));
    }
  }

  Future<void> toggleLanguage() async {
    final newLanguageCode = _currentLocale.languageCode == 'en' ? 'ar' : 'en';
    await changeLanguage(newLanguageCode);
  }

  bool get isArabic => _currentLocale.languageCode == 'ar';
  bool get isEnglish => _currentLocale.languageCode == 'en';

  // Helper method to get localized strings
  static AppLocalizations getLocalizations(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
