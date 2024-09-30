import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/constants.dart';
import '../../../common/utils/extension_context.dart';
import 'custom_list_tile.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key, required this.theme});

  final bool theme;

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  bool theme = false;

  void changeTheme(BuildContext context) async {
    if (theme) {
      await context.dependencies.shp.setBool(Constants.getTheme, false);
    } else {
      await context.dependencies.shp.setBool(Constants.getTheme, true);
    }
    if(context.mounted){
      context.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    theme = widget.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
        title: Text(context.lang.theme),
        actions: [
          IconButton(
            onPressed: () => changeTheme(context),
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
            color: theme ? context.colorScheme.primaryContainer : Colors.transparent,
            title: context.lang.darkBlue,
            trailing: Icon(
              !theme ? Icons.arrow_forward_ios : Icons.check,
              size: 20,
            ),
            onTap: () {
              setState(() {
                theme = true;
              });
            },
          ),
          CustomListTile(
            color: !theme ? context.colorScheme.primaryContainer : Colors.transparent,
            title: context.lang.black,
            trailing: Icon(
              theme ? Icons.arrow_forward_ios : Icons.check,
              size: 20,
            ),
            onTap: () {
              setState(() {
                theme = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
