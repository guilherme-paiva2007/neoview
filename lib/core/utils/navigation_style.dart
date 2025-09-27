import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void navigationStyle({
  Brightness statusBarBrightness = Brightness.dark,
  Brightness navigationBarBrightness = Brightness.dark,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: statusBarBrightness == Brightness.light ?
          Brightness.dark : Brightness.light,
        statusBarIconBrightness: statusBarBrightness,
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: navigationBarBrightness,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
      )
    );
  });
}