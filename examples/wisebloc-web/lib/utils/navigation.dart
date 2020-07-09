import 'package:flutter/material.dart';
import 'package:wiseair_platform/pages/HomePage/HomePage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Pages.homePage: return setRoute(settings,HomePage());
    default: return setRoute(settings,HomePage());
  }
}

class Pages {
  static const String homePage = "/home";
}


// Navigation class

class Navigation {

  static final Navigation navigation = new Navigation.initialize();
  factory Navigation() {return navigation;}
  Navigation.initialize();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }

}

// Convenience methods

MaterialPageRoute setRoute(RouteSettings settings, Widget page) => MaterialPageRoute(settings: RouteSettings(name: settings.name), builder: (context) => page);
