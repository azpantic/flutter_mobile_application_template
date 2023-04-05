import 'package:get_storage/get_storage.dart';

import '../constans.dart';

class Settings {
  static final settings = () => GetStorage('Settings');
  final lang = 'system'.val('lang');
  final isStaticColor = false.val('isStaticColor');
  final colorSeed = appColor.value.val('colorSeed');
  final themeModeIndex = 0.val('themeModeIndex');
}
