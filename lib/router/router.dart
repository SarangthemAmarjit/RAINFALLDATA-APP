import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rainfalldata/pages/dashboard.dart';
import 'package:rainfalldata/pages/splash_screen.dart';
import 'package:rainfalldata/pages/subdivsionpage.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRouteRoute.page,
          path: '/',
        ),
        AutoRoute(page: HomeRoute.page, path: '/homepage'),
        AutoRoute(page: SubDivisionRoute.page, path: '/subdivisionpage'),

        /// routes go here
      ];
}
