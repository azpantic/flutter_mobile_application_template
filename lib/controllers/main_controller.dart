import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt page = 0.obs;

  RxBool isDarkMode = true.obs;

  // var themeMode = ThemeMode.system.obs;
}
