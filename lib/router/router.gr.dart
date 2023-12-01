// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(key: args.key),
      );
    },
    SplashRouteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreenPage(),
      );
    },
    SubDivisionRoute.name: (routeData) {
      final args = routeData.argsAs<SubDivisionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SubDivisionPage(
          key: args.key,
          subdivisionname: args.subdivisionname,
        ),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashScreenPage]
class SplashRouteRoute extends PageRouteInfo<void> {
  const SplashRouteRoute({List<PageRouteInfo>? children})
      : super(
          SplashRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SubDivisionPage]
class SubDivisionRoute extends PageRouteInfo<SubDivisionRouteArgs> {
  SubDivisionRoute({
    Key? key,
    required String subdivisionname,
    List<PageRouteInfo>? children,
  }) : super(
          SubDivisionRoute.name,
          args: SubDivisionRouteArgs(
            key: key,
            subdivisionname: subdivisionname,
          ),
          initialChildren: children,
        );

  static const String name = 'SubDivisionRoute';

  static const PageInfo<SubDivisionRouteArgs> page =
      PageInfo<SubDivisionRouteArgs>(name);
}

class SubDivisionRouteArgs {
  const SubDivisionRouteArgs({
    this.key,
    required this.subdivisionname,
  });

  final Key? key;

  final String subdivisionname;

  @override
  String toString() {
    return 'SubDivisionRouteArgs{key: $key, subdivisionname: $subdivisionname}';
  }
}
