import 'package:company_profile/constants.dart';
import 'package:company_profile/generated/l10n.dart';
import 'package:company_profile/home/data/changeLang/bloc/change_language_bloc.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/presentation/widgets/layout.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(DevicePreview(
    // enabled: true,
    enabled: false,
    builder: (context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BrokerCubit(),),
        BlocProvider(create: (context) => AppLanguageBloc()),
      ],
      child: Builder(builder: (context) {
        var langState = context.select((AppLanguageBloc bloc) => bloc.state);
        return MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(primary: basicC4),
        ),
        locale: langState is AppChangeLanguage ? langState.languageCode == 'ar' ? const Locale('ar') : const Locale('en') : const Locale('ar'),
        localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
        supportedLocales: S.delegate.supportedLocales,

        builder: (context, child) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, child!),
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(240, name: MOBILE),
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            // ResponsiveBreakpoint.autoScale(650, name: TABLET),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
          breakpointsLandscape: const [
            ResponsiveBreakpoint.resize(560, name: MOBILE),
            ResponsiveBreakpoint.autoScale(812, name: MOBILE),
            ResponsiveBreakpoint.resize(1024, name: TABLET),
            ResponsiveBreakpoint.autoScale(1120, name: TABLET),
          ],
        ),
        debugShowCheckedModeBanner: false,
        home: const Layout(),
      );
      },
      )
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}