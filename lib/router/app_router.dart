import 'package:app/router/routing_animation.dart';
import 'package:app/src/entry_point/entry_point.dart';
import 'package:app/src/notification/form_page.dart';
import 'package:app/src/notification/record_page.dart';
import 'package:app/src/notification/requests_page.dart';
import 'package:app/src/profile/profile_page.dart';
import 'package:app/src/roadmap/roadmap_page.dart';
import 'package:app/src/skills/skills_page.dart';
import 'package:app/src/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final Provider<GoRouter> routerProvider = Provider((ref) => router);

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

// GoRouter configuration
final router = GoRouter(
  initialLocation: RoutesDocument.profile,
  navigatorKey: _rootNavigatorKey,
  // redirect: (context, state) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final authentication = prefs.get(Preferences.authentication);
  //   if (authentication == null) {
  //     return RoutesDocument.login;
  //   }
  //   return null;
  // },
  routes: [
    GoRoute(
      path: RoutesDocument.login,
      pageBuilder: (context, state) => instanTransition(state, const LoginPage()),
    ),

    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) => instanTransition(state, EntryPoint(child: child)),
      routes: [
        GoRoute(
          path: RoutesDocument.roadmap,
          pageBuilder: (context, state) => instanTransition(state, const RoadmapPage()),
        ),
        GoRoute(
          path: RoutesDocument.profile,
          pageBuilder: (context, state) => instanTransition(state, const ProfilePage()),
        ),
        GoRoute(
          path: RoutesDocument.skills,
          pageBuilder: (context, state) => instanTransition(state, const SkillsPage()),
        ),
        ShellRoute(
          pageBuilder: (context, state, child) => instanTransition(state, RequestsPage(child: child)),
          routes: [
            GoRoute(
              path: RoutesDocument.requestsHistory,
              pageBuilder: (context, state) => instanTransition(state, const RequestsHistoryPage()),
            ),
            GoRoute(
              path: RoutesDocument.requestsFormPage,
              pageBuilder: (context, state) => instanTransition(state, const FormPage()),
            ),
          ],
        ),
      ],
    ),
  ],
);

class RoutesDocument {
  const RoutesDocument._();
  static const String home = '/';
  static const String login = '/login';

  static const String roadmap = '/roadmap';
  static const String profile = '/profile';
  static const String skills = '/skills';

  static const String requestsHistory = '/requests/history';
  static const String requestsFormPage = '/requests/form';

  // // Product
  // static String productDetails(String id) => 'product-details/$id';
}

  // final encodedItemId = getEncodedComponent(item.id);
  // context.push(
  //     "${RoutesDocument.pharmacyHome}/${RoutesDocument.productDetails(encodedItemId)}");
