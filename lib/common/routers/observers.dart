import 'package:flutter/material.dart';

import 'index.dart';

/// 记录路由的变化
class RouteObservers<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    var name = route.settings.name ?? '';
    if (name.isNotEmpty) RouterPages.history.add(name);
    debugPrint('didPush');
    debugPrint(RouterPages.history.toString());
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    RouterPages.history.remove(route.settings.name);
    debugPrint('didPop');
    debugPrint(RouterPages.history.toString());
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      var index = RouterPages.history.indexWhere((element) {
        return element == oldRoute?.settings.name;
      });
      var name = newRoute.settings.name ?? '';
      if (name.isNotEmpty) {
        if (index > 0) {
          RouterPages.history[index] = name;
        } else {
          RouterPages.history.add(name);
        }
      }
    }
    debugPrint('didReplace');
    debugPrint(RouterPages.history.toString());
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    RouterPages.history.remove(route.settings.name);
    debugPrint('didRemove');
    debugPrint(RouterPages.history.toString());
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
}
