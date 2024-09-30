import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    colorScheme: flexSchemeLight,
    fontFamily: "Poppins",
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    colorScheme: flexSchemeDark,
    fontFamily: "Poppins",
    useMaterial3: true,
  );
}

const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff1a1a1a),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff67686D),
  onPrimaryContainer: Color(0xff0296e5),
  secondary: Color(0xff292929),
  onSecondary: Color(0xffd6d6d6),
  secondaryContainer: Color(0xff3a3a3a),
  onSecondaryContainer: Color(0xfff0f0f0),
  tertiary: Color(0xff353535),
  onTertiary: Color(0xffc8c8c8),
  tertiaryContainer: Color(0xff474747),
  onTertiaryContainer: Color(0xffededed),
  error: Color(0xffcf6679),
  onError: Color(0xffffffff),
  errorContainer: Color(0xff8b0000),
  onErrorContainer: Color(0xfff5c6cb),
  surface: Color(0xff1e1e1e),
  onSurface: Color(0xffe6e6e6),
  onSurfaceVariant: Color(0xffb0b0b0),
  outline: Color(0xff606060),
  outlineVariant: Color(0xff404040),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff2e2e2e),
  onInverseSurface: Color(0xfffafafa),
  inversePrimary: Color(0xff2a2a2a),
  surfaceTint: Color(0xff5c5c5c),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff242a32),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff67686D),
  onPrimaryContainer: Color(0xff0296e5),
  secondary: Color(0xff3A3F47),
  onSecondary: Color(0xff101413),
  secondaryContainer: Color(0xff003822),
  onSecondaryContainer: Color(0xffdfe8e5),
  tertiary: Color(0xffFF8700),
  onTertiary: Color(0xff0e1414),
  tertiaryContainer: Color(0xff004c6a),
  onTertiaryContainer: Color(0xffdfebf0),
  error: Color(0xffffb4ab),
  onError: Color(0xff141211),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xfff6dfe1),
  surface: Color(0xff161b16),
  onSurface: Color(0xffecedec),
  onSurfaceVariant: Color(0xffdfe1df),
  outline: Color(0xff767d76),
  outlineVariant: Color(0xff2c2e2c),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfff8fdf8),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff446d43),
  surfaceTint: Color(0xff7edb7b),
);
