import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/src/common/style/app_icons.dart';

import '../../../common/l10n/generated/l10n.dart';

class NoMovie extends StatelessWidget {
  const NoMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.magicBox),
          const SizedBox(height: 15),
          SizedBox(
            width: 200,
            child: Text(
              S.of(context).noMovie,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 190,
            child: Text(
              S.of(context).findMovie,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          )
        ],
      ),
    );
  }
}
