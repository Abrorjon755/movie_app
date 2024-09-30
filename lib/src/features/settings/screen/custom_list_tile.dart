import 'package:flutter/material.dart';

import '../../../common/utils/extension_context.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.trailing,
    required this.onTap,
    this.color = Colors.transparent,
  });

  final String title;
  final Widget? trailing;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
      trailing: trailing,
      tileColor: color,
    );
  }
}
