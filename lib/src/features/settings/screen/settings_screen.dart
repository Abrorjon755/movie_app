import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/constants.dart';
import '../../../common/router/app_router.dart';
import '../../../common/utils/extension_context.dart';
import '../../../common/widgets/app.dart';
import '../../../common/widgets/app_scope.dart';
import 'custom_list_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLight = false;
  bool isEn = false;

  void getTheme() {
    isLight = context.dependencies.shp.getBool(Constants.getTheme) ?? false;
    setState(() {});
  }

  void getLanguage() {
    isEn = context.dependencies.shp.getBool(Constants.getLocale) ?? false;
    setState(() {});
  }

  void afterChangeTheme(BuildContext context) async {
    await context.push(AppRouter.settingsTheme, extra: !isLight);
    getTheme();
    if (context.mounted) {
      context.findAncestorStateOfType<AppScopeState>()?.dependencies.theme =
          isLight;
      context.findAncestorStateOfType<MyAppState>()?.setState(() {});
    }
  }

  void afterChangeLanguage(BuildContext context) async {
    await context.push(AppRouter.settingsLanguage, extra: !isEn);
    getLanguage();
    if(context.mounted){
      context.findAncestorStateOfType<AppScopeState>()?.dependencies.locale =
          isEn;
      context.findAncestorStateOfType<MyAppState>()?.setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getTheme();
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
        centerTitle: true,
        title: Text(
          context.lang.settings,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
      body: ListView(
        children: [
          Divider(color: context.colorScheme.primaryContainer),
          CustomListTile(
            onTap: () => afterChangeTheme(context),
            title: context.lang.settings,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isLight ? context.lang.black : context.lang.darkBlue,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.primaryContainer,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.colorScheme.primaryContainer,
                  size: 15,
                ),
              ],
            ),
          ),
          Divider(color: context.colorScheme.primaryContainer),
          CustomListTile(
            onTap: () => afterChangeLanguage(context),
            title: context.lang.language,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEn ? "Русский" : "English",
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.primaryContainer,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.colorScheme.primaryContainer,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
