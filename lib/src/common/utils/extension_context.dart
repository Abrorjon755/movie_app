import 'package:flutter/material.dart';
import '../dependency/app_dependencies.dart';
import '../l10n/generated/l10n.dart';
import '../widgets/app_scope.dart';

extension ContextX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  S get lang => S.of(this);

  AppDependencies get dependencies =>
      findAncestorStateOfType<AppScopeState>()?.dependencies ??
      (throw ArgumentError("Not find MyAppState"));
}
