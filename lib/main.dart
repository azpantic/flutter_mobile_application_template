import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/main_controller.dart';
import 'i18n/strings.g.dart';
import 'routes.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(MainController());

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
    return Obx(
      () => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale:
            TranslationProvider.of(context).flutterLocale, // use provideraQ  8
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,

        theme: ThemeData(
          colorScheme: controller.isStaticColor()
              ? ColorScheme.fromSeed(seedColor: controller.colorSeed())
              : controller.lightColorScheme(),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: controller.isStaticColor()
              ? ColorScheme.fromSeed(
                  seedColor: controller.colorSeed(),
                  brightness: Brightness.dark)
              : controller.darkColorScheme(),
          useMaterial3: true,
        ),

        themeMode: ThemeMode.values[controller.theme().index],

        routerConfig: router,
      ),
    );
  }
}
