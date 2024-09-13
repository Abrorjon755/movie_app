import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/src/features/watch_list/screen/no_movie.dart';

import '../../../common/style/app_icons.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: true
                  ? const NoMovie()
                  : ListView(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      children: [
                        for (int i = 0; i < 2; i++)
                          Column(
                            children: [
                              Row(
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const SizedBox(
                                      width: 95,
                                      height: 120,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Spiderman",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      const SizedBox(height: 14),
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppIcons.star),
                                          const SizedBox(width: 5),
                                          Text(
                                            "9.5",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppIcons.ticket),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Action",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppIcons.calendar),
                                          const SizedBox(width: 5),
                                          Text(
                                            "2019",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppIcons.clock),
                                          const SizedBox(width: 5),
                                          Text(
                                            "139 minutes",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
