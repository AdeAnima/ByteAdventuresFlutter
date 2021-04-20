import 'package:flutter/material.dart';

class HomeRouteInformationParser extends RouteInformationParser<NavigationRoute> {
  @override
  Future<NavigationRoute> parseRouteInformation(RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      throw Exception('Unknown route info');
    }

    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return HomeRoute();
    }

    if (uri.pathSegments.length == 1) {
      final pathName = uri.pathSegments.elementAt(0).toString();
      switch (pathName) {
        case 'overview':
          break;
        case 'infos':
          break;
        case 'speakers':
          break;
        case 'partners':
          break;
        case 'team':
          break;
        default:
          return HomeRoute();
      }
    }

    return HomeRoute();
  }

  @override
  RouteInformation restoreRouteInformation(NavigationRoute configuration) =>
      RouteInformation(location: configuration.route);
}

abstract class NavigationRoute {
  int get pageIndex;
  String get route;
}

class HomeRoute extends NavigationRoute {
  @override
  int get pageIndex => 0;

  @override
  String get route => '/';
}
