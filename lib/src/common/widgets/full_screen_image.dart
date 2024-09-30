import 'package:flutter/material.dart';

import '../utils/extension_context.dart';
import 'my_cached_image.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
      ),
      body: InteractiveViewer(
        maxScale: 5,
        child: Hero(
          tag: imageUrl,
          child: Center(
            child: MyCachedImage(imageUrl: imageUrl),
          ),
        ),
      ),
    );
  }
}
