import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/constants.dart';
import '../../../common/utils/extension_context.dart';
import 'custom_list_tile.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key, required this.isEn});

  final bool isEn;

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  bool isEn = false;

  void changeLanguage(BuildContext context) async {
    if (isEn) {
      await context.dependencies.shp.setBool(Constants.getLocale, false);
    } else {
      await context.dependencies.shp.setBool(Constants.getLocale, true);
    }
    if (context.mounted) {
      context.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    isEn = widget.isEn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
        title: Text(context.lang.language),
        actions: [
          IconButton(
            onPressed: () => changeLanguage(context),
            icon: Icon(
              Icons.check,
              color: context.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          CustomListTile(
            color: isEn
                ? context.colorScheme.primaryContainer
                : Colors.transparent,
            title: "English",
            trailing: Icon(
              !isEn ? Icons.arrow_forward_ios : Icons.check,
              size: 20,
            ),
            onTap: () {
              setState(() {
                isEn = true;
              });
            },
          ),
          CustomListTile(
            color: !isEn
                ? context.colorScheme.primaryContainer
                : Colors.transparent,
            title: "Русский",
            trailing: Icon(
              isEn ? Icons.arrow_forward_ios : Icons.check,
              size: 20,
            ),
            onTap: () {
              setState(() {
                isEn = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
