import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_mobile_application_template/subpages/settings_subpage.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'controllers/main_controller.dart';
import 'i18n/strings.g.dart';
import 'pages/castom_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

final MainController _controller = Get.find();
final _rootNavigationKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final List<Widget> children = <Widget>[
  for (int i = 0; i < 10; i++)
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: const Color.fromARGB(255, 255, 201, 197),
        height: 400,
      ),
    )
];

final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      // ShellRoute показывает UI-оболочку вокруг соответствующего дочернего маршрута
      builder: (context, state, child) {
        // UI-оболочка - это Scaffold с NavigationBar
        return Obx(() => AdaptiveScaffold(
              internalAnimations: true,
              smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
              mediumBreakpoint:
                  const WidthPlatformBreakpoint(begin: 700, end: 1000),
              largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
              useDrawer: false,
              selectedIndex: _controller.page(),
              onSelectedIndexChange: (int index) {
                _controller.page(index);
                return context.go(
                  ['/home', '/custom', '/profile'][index],
                );
              },
              destinations: <NavigationDestination>[
                NavigationDestination(
                  selectedIcon: const Icon(Icons.home),
                  icon: const Icon(Icons.home_outlined),
                  label: t.navbar.homepage,
                ),
                NavigationDestination(
                  selectedIcon: const Icon(Icons.library_books),
                  icon: const Icon(Icons.library_books_outlined),
                  label: t.navbar.castompage,
                ),
                NavigationDestination(
                  selectedIcon: const Icon(Icons.person_2),
                  icon: const Icon(Icons.person_2_outlined),
                  label: t.navbar.profile,
                )
              ],
              body: (_) => child,
            ));
      },
      // Вложенные маршруты для каждой вкладки
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const HomePage(),
          ),
          routes: const [],
        ),
        GoRoute(
          path: '/custom',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const CastomPage(),
          ),
          routes: const [],
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const ProfilePage(),
          ),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigationKey,
              path: 'settings',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const SettingsSubpage(),
              ),
              routes: const [],
            ),
          ],
        ),
      ],
    ),
  ],
);
