import 'package:ebla/utils/colored_printer.dart';
import 'package:flutter/material.dart';

class RoutingObserver extends NavigatorObserver {
  // Called when a new route has been pushed, and the current route is removed.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    ColoredPrinter.printColored(
        'Route pushed: ${route.settings.name}', AnsiColor.green);
  }

  // Called when a route has been popped or removed.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    ColoredPrinter.printColored(
        'Route popped: ${route.settings.name}', AnsiColor.green);
  }

  // Called when a route has been replaced.
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null && oldRoute != null) {
      ColoredPrinter.printColored(
          'Route replaced: ${oldRoute.settings.name} -> ${newRoute.settings.name}');
    }
  }

  // Called when a route is being removed to the back stack.
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    ColoredPrinter.printColored('Route removed: ${route.settings.name}');
  }

  // Called when a route is being removed but is still in the middle of animating.
  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    ColoredPrinter.printColored('User started a navigation gesture.');
  }

  // Called when a user gesture has ended, and the route is being animated or pushed.
  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    ColoredPrinter.printColored('User stopped the navigation gesture.');
  }
}
