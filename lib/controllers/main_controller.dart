import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/constans.dart';
import 'package:get/get.dart';

import '../models/settings.dart';

class MainController extends GetxService {
  RxInt page = 0.obs;

  RxBool isStaticColor = true.obs;
  var colorSeed = appColor.obs;

  final theme = themeMode.system.obs;

  @override
  void onInit() {
    isStaticColor(Settings().isStaticColor.val);
    colorSeed(Color(Settings().colorSeed.val));
    theme(themeMode.values[Settings().themeModeIndex.val]);
    // ever(lang, (callback) => Settings().lang.val = callback);
    ever(colorSeed, (callback) => Settings().colorSeed.val = callback.value);
    ever(isStaticColor, (callback) => Settings().isStaticColor.val = callback);
    ever(theme, (callback) => Settings().themeModeIndex.val = callback.index);
    super.onInit();
  }
}

enum themeMode { system, light, dark }
