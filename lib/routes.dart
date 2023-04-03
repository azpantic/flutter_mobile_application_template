import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'controllers/main_controller.dart';
import 'i18n/strings.g.dart';
import 'pages/home_page.dart';

final _controller = MainController();
final _rootNabigationKey = GlobalKey<NavigatorState>();
final _shellNabigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNabigationKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNabigationKey,
      // ShellRoute показывает UI-оболочку вокруг соответствующего дочернего маршрута
      builder: (context, state, child) {
        // UI-оболочка - это Scaffold с NavigationBar
        return Obx(() => Scaffold(
              body: child,
              bottomNavigationBar: NavigationBar(
                  selectedIndex: _controller.page(),
                  // Используем tabs для создания NavigationBarDestination
                  destinations: [
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
                  // Используем context.go для перехода к нужному маршруту при нажатии на вкладку
                  onDestinationSelected: (index) {
                    _controller.page(index);
                    return context.go(
                      ['/home', '/castompage', '/profile'][index],
                    );
                  }),
            ));
      },
      // Вложенные маршруты для каждой вкладки
      routes: [
        GoRoute(
          path: "/home",
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: HomePage(),
          ),
          routes: [],
        ),
        GoRoute(
          path: '/castompage',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: CastomPage(),
          ),
          routes: [],
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: ProfilePage(),
          ),
          routes: [],
        ),
      ],
    ),
  ],
);
