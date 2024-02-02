import 'package:bloc/bloc.dart';

part 'change_language_event.dart';
part 'change_language_state.dart';

class AppLanguageBloc extends Bloc<AppLanguageEvent, AppLanguageState> {
  AppLanguageBloc() : super(AppLanguageInitial()) {
    on<ArabicLanguageEvent>((event, emit) {
      emit(AppChangeLanguage(languageCode: 'ar'));
    });
    on<EnglishLanguageEvent>((event, emit) {
      emit(AppChangeLanguage(languageCode: 'en'));
    });
  }
}
