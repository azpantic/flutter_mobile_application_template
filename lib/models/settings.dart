import 'package:flutter_mobile_application_template/constans.dart';
import 'package:isar/isar.dart';

import '../controllers/main_controller.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  String? lang;
  bool isStaticColor = false;
  String colorSeed = appColor.value.toString();

  @enumerated
  themeMode theme = themeMode.system;
}
