import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/constans.dart';
import 'package:flutter_mobile_application_template/controllers/main_controller.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:get/get.dart';

class ThemeToggle extends GetView<MainController> {
  const ThemeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(appRoundRadius)),
                    child: const Icon(Icons.android),
                  ),
                ),
                Text(t.settings.system_theme)
              ],
            ),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: InkResponse(
                    onTap: () {
                      controller.isDarkMode(false);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(appRoundRadius)),
                      child: const Icon(Icons.sunny),
                    ),
                  ),
                ),
                Text(t.settings.light_theme)
              ],
            ),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: InkResponse(
                    onTap: () {
                      controller.isDarkMode(true);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(appRoundRadius)),
                      child: const Icon(Icons.dark_mode),
                    ),
                  ),
                ),
                Text(t.settings.dark_theme)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
