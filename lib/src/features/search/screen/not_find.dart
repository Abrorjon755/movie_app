import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/style/app_icons.dart';
import '../../../common/utils/extension_context.dart';

class NotFind extends StatelessWidget {
  const NotFind({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.noResult),
          const SizedBox(height: 15),
          SizedBox(
            width: 200,
            child: Text(
              context.lang.notFound,
              style: context.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 190,
            child: Text(
              context.lang.findMovie,
              textAlign: TextAlign.center,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.primaryContainer,
              ),
            ),
          )
        ],
      ),
    );
  }
}
