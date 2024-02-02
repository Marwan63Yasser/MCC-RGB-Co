part of 'change_language_bloc.dart';

abstract class AppLanguageState {
  final String? languageCode = 'ar';
}

class AppLanguageInitial extends AppLanguageState {}

class AppChangeLanguage extends AppLanguageState {
  @override
  // ignore: overridden_fields
  final String? languageCode;

  AppChangeLanguage({this.languageCode});
}
