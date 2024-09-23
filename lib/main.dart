import 'package:flutter/material.dart';

import 'src/common/widgets/app.dart';
import 'src/common/widgets/app_scope.dart';
import 'src/common/widgets/initialize_app.dart';

void main() async {
  final dependencies = await (const InitializeApp().initialize());

  runApp(
    AppScope(
      dependencies: dependencies,
      child: const MyApp(),
    ),
  );
}
