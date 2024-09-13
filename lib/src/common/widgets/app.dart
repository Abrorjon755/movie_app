import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/common/constants/constants.dart';
import 'package:movie_app/src/common/style/app_theme.dart';
import 'package:movie_app/src/features/home/screen/home_screen.dart';

import '../l10n/generated/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool theme = false;
  Locale locale = const Locale("en");

  void getTheme() {
    theme = shp.getBool(Constants.getTheme) ?? false;
    setState(() {});
  }

  void getLocale() {
    locale = switch (shp.getString(Constants.getLocale)) {
      "ru" => const Locale("ru"),
      "en" => const Locale("en"),
      _ => const Locale("En"),
    };
  }

  @override
  void initState() {
    super.initState();
    getTheme();
    getLocale();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ru"),
      ],
      theme: theme ? AppTheme.lightTheme : AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
