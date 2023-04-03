import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobile_application_template/constans.dart';
import 'package:flutter_mobile_application_template/controllers/main_controller.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:flutter_mobile_application_template/widgets/settings_subpage_widgets/theme_toogle.dart';
import 'package:get/get.dart';

class SettingsSubpage extends GetView<MainController> {
  const SettingsSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(appPadding),
            child: ThemeToggle(),
          )
        ],
      ),
    );
  }
}
