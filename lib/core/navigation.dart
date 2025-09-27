import 'package:flutter/material.dart';
import 'package:neoview/core/utils/navigation_style.dart';
import 'package:neoview/screens/home.dart';
import 'package:neoview/screens/instructions.dart';
import 'package:neoview/screens/login.dart';
import 'package:neoview/screens/pair.dart';
import 'package:neoview/screens/profile.dart';
import 'package:neoview/screens/register.dart';

enum AppRoutes {
  login(Brightness.light, Brightness.dark, _login),
  register(Brightness.light, Brightness.dark, _register),
  home(Brightness.dark, Brightness.dark, _home),
  profile(Brightness.light, Brightness.dark, _profile),
  pair(Brightness.dark, Brightness.dark, _pair),
  instructions(Brightness.dark, Brightness.dark, _instructions);

  final Brightness statusBar;
  final Brightness navigationBar;
  final Widget Function(BuildContext) getRoute;

  const AppRoutes(this.statusBar, this.navigationBar, this.getRoute);

  bool stack(BuildContext context) {
    if (currentRoute == this) return false;
    navigationStyle(statusBarBrightness: statusBar, navigationBarBrightness: navigationBar);
    _stack.add(this);
    currentRoute = this;
    Navigator.of(context).pushNamed(name);
    return true;
  }

  bool resetTo(BuildContext context) {
    if (currentRoute == this) return false;
    navigationStyle(statusBarBrightness: statusBar, navigationBarBrightness: navigationBar);
    _stack.clear();
    _stack.add(this);
    currentRoute = this;
    Navigator.of(context).pushNamedAndRemoveUntil(name, (route) => false,);
    return true;
  }

  bool popAndStack(BuildContext context) {
    if (currentRoute == this) return false;
    navigationStyle(statusBarBrightness: statusBar, navigationBarBrightness: navigationBar);
    _stack.removeLast();
    _stack.add(this);
    currentRoute = this;
    Navigator.of(context)..pop()..pushNamed(name);
    return true;
  }

  factory AppRoutes.byName(String name) => AppRoutes.values.firstWhere((e) => e.name == name);

  static bool pop(BuildContext context) {
    final navigator = Navigator.of(context);
    if (!navigator.canPop()) return false;
    navigator.pop();
    _stack.removeLast();
    currentRoute = _stack.last;
    return true;
  }

  static bool reset(BuildContext context) => initialRoute.resetTo(context);

  static final List<AppRoutes> _stack = [];
  static late AppRoutes initialRoute;
  static late AppRoutes currentRoute;

  static final Map<String, Widget Function(BuildContext)> routes = Map.unmodifiable({
    for (var route in AppRoutes.values) route.name: route.getRoute
  });

  static String initNavigation(AppRoutes route) {
    _stack.add(route);
    initialRoute = route;
    currentRoute = route;
    return route.name;
  }

  static Widget _login(BuildContext _) => const Login();
  static Widget _register(BuildContext _) => const Register();
  static Widget _home(BuildContext _) => const Home();
  static Widget _profile(BuildContext _) => const Profile();
  static Widget _pair(BuildContext _) => const Pair();
  static Widget _instructions(BuildContext _) => const Instructions();
}