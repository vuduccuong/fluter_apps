import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/bottom_nav_localizations.dart';
import 'package:bottom_navigation/widgets/bottom_navigation.dart';

void main() async {
  runApp(const MaterialApp(
    localizationsDelegates: [
      BottomNavLocalizations.delegate,
    ],
    supportedLocales: [
      Locale("en"),
      Locale("vi"),
    ],
    home: DemoBottomNav(),
  ));
}
