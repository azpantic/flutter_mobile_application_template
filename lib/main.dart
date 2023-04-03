import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobile_application_template/constans.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import 'controllers/main_controller.dart';
import 'i18n/strings.g.dart';
import 'models/settings.dart';
import 'routes.dart';

Future<void> main() async {
  Get.put(MainController(), permanent: true);

  WidgetsFlutterBinding.ensureInitialized();
  // settingsData!.lang == null
  //     ? LocaleSettings.useDeviceLocale()
  //     : LocaleSettings.setLocale(AppLocale.values.singleWhere(
  //         (element) => element.languageCode == settingsData?.lang));
  LocaleSettings.useDeviceLocale();

  settingUpSystemUIOverlay();

  runApp(TranslationProvider(child: const MyApp()));
}

void settingUpSystemUIOverlay() {
// Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
// Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends GetView<MainController> {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: TranslationProvider.of(context)
              .flutterLocale, // use provideraQ  8
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,

          theme: ThemeData(
            // colorSchemeSeed: controller.settings().colorSeed,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            // colorSchemeSeed: controller.colorSeed(),
            useMaterial3: true,
          ),

          themeMode: ThemeMode.values[controller.settings().theme.index],

          routerConfig: router,
        ));
  }
}
