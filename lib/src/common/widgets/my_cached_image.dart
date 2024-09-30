import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/constants.dart';
import '../utils/extension_context.dart';

class MyCachedImage extends StatelessWidget {
  const MyCachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: "$imageUrl?${Constants.apiKeyString}",
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: context.colorScheme.outline,
        highlightColor: context.colorScheme.outlineVariant,
        child: ColoredBox(color: context.colorScheme.primary),
      ),
      errorWidget: (context, url, error) => Image(
        fit: fit,
        image: const NetworkImage(
            "https://is-kushenie.ru/img/defaultAvatars/no-image.png"),
      ),
    );
  }
}
