import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:get/get.dart';

class HomePage extends GetView<void> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.navbar.homepage),
        ),
        body: Center(
          child: Container(
            height: context.mediaQueryShortestSide / 2,
            color: context.theme.colorScheme.primary,
            child: const AspectRatio(
              aspectRatio: 1,
            ),
          ),
        ));
  }
}
