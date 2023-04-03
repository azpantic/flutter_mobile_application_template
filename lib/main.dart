import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'controllers/main_controller.dart';
import 'i18n/strings.g.dart';
import 'routes.dart';

void main() {
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends GetView<MainController> {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale:
          TranslationProvider.of(context).flutterLocale, // use provideraQ  8
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,

      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,

      routerConfig: router,
    );
  }
}
