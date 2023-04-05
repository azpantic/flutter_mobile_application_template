import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/constans.dart';
import 'package:get/get.dart';

import '../models/settings.dart';

class MainController extends GetxService {
  RxInt page = 0.obs;

  RxBool isStaticColor = true.obs;
  var colorSeed = appColor.obs;

  final theme = themeMode.system.obs;
  var lightColorScheme = ColorScheme.light().obs;
  var darkColorScheme = ColorScheme.dark().obs;

  void _setDynamic() async {
    var colorPalette = await DynamicColorPlugin.getCorePalette();
    if (colorPalette != null) {
      lightColorScheme(colorPalette.toColorScheme());
      darkColorScheme(colorPalette.toColorScheme(brightness: Brightness.dark));
    } else {
      var accent = await DynamicColorPlugin.getAccentColor();
      lightColorScheme(ColorScheme.fromSeed(seedColor: accent ?? appColor));
      darkColorScheme(ColorScheme.fromSeed(
          seedColor: accent ?? appColor, brightness: Brightness.dark));
    }
  }

  @override
  Future<void> onInit() async {
    isStaticColor(Settings().isStaticColor.val);
    colorSeed(Color(Settings().colorSeed.val));
    theme(themeMode.values[Settings().themeModeIndex.val]);
    // ever(lang, (callback) => Settings().lang.val = callback);
    ever(colorSeed, (callback) => Settings().colorSeed.val = callback.value);
    ever(isStaticColor, (callback) {
      if (!callback) _setDynamic();
      Settings().isStaticColor.val = callback;
    });
    ever(theme, (callback) => Settings().themeModeIndex.val = callback.index);

    if (!isStaticColor()) _setDynamic();

    super.onInit();
  }
}

enum themeMode { system, light, dark }
