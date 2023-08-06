import 'package:bottom_app_bar/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {

  runApp(
    const MaterialApp(
      title: "Hehe",
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('vi'),
      ],
      debugShowCheckedModeBanner: false,
      home: CustomBottomAppBar(),
    ),
  );
}
