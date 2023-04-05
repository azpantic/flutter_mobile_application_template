import 'package:flutter_mobile_application_template/models/settings.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class MainController extends GetxController {
  RxInt page = 0.obs;

  late final Isar db;
  final settings = Settings().obs;

  void changeTheme(val) {}

  @override
  Future<void> onInit() async {
    db = await Isar.open([SettingsSchema]);

    await db.writeTxn(() => db.settings.put(Settings()));

    settings(await db.settings.get(1));

    ever(
        settings,
        (callback) async =>
            await db.writeTxn(() async => await db.settings.put(settings())));
    // TODO: implement onInit
    super.onInit();
  }
  // var themeMode = ThemeMode.system.obs;
}

enum themeMode { system, light, dark }
