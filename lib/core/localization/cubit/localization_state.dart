part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

final class LocalizationChanged extends LocalizationState {
  final Locale locale;
  
  LocalizationChanged(this.locale);
}

final class LocalizationError extends LocalizationState {
  final String message;
  
  LocalizationError(this.message);
}
