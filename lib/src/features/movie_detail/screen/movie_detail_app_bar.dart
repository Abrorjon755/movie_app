import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/models/movies_model.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/utils/extension_context.dart';

class MovieDetailAppBar extends StatefulWidget {
  const MovieDetailAppBar({super.key, required this.movie});

  final MovieModel movie;

  @override
  State<MovieDetailAppBar> createState() => _MovieDetailAppBarState();
}

class _MovieDetailAppBarState extends State<MovieDetailAppBar> {
  bool isSaved = false;

  void saveMovie() {
    if (!isSaved) {
      saveToStorage();
    } else {
      deleteFromStorage();
    }
    setState(() {
      isSaved = !isSaved;
    });
  }

  Future<void> saveToStorage() async {
    final movie = widget.movie.copyWith(isSelected: !isSaved);
    await context.dependencies.db.insert(movie.toMap());
  }

  void deleteFromStorage() async {
    await context.dependencies.db.delete(widget.movie.id);
  }

  void checkSaved() async {
    isSaved =
        (await context.dependencies.db.getMovie(widget.movie.id))?.isSelected ??
            false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkSaved();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: context.colorScheme.primary,
      title: Text(
        context.lang.detail,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.onPrimary,
        ),
      ),
      leadingWidth: 60,
      pinned: true,
      scrolledUnderElevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: saveMovie,
          icon: SvgPicture.asset(
            isSaved ? AppIcons.saved : AppIcons.save,
            colorFilter: ColorFilter.mode(
              context.colorScheme.onPrimary,
              BlendMode.srcATop,
            ),
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
