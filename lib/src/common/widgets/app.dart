import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../router/app_router.dart';
import '../style/app_theme.dart';
import '../l10n/generated/l10n.dart';
import '../utils/extension_context.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      locale: context.dependencies.locale,
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
      theme:
          context.dependencies.theme ? AppTheme.lightTheme : AppTheme.darkTheme,
    );
  }
}
