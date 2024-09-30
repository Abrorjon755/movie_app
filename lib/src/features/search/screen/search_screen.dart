import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/models/genre.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/router/app_router.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/utils/debouncing_throttling.dart';
import '../../../common/utils/extension_context.dart';
import '../../home/screen/home_screen.dart';
import 'search_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Genre> genres = [];

  void getGenre() async {
    genres = await context.dependencies.movieDetailRepository.getGenre();
    setState(() {});
  }

  late final ScrollController controller;

  final throttling = Throttling(const Duration(milliseconds: 300));
  final debouncer = Debouncing(const Duration(milliseconds: 300));

  List<MovieModel> movies = [];
  String searchText = '';
  int page = 1;

  void onChange(String value) async {
    searchText = value;
    page = 1;

    movies = await context.dependencies.searchRepository.getMovies(
      page: page++,
      text: searchText,
    );

    setState(() {});
  }

  void pagination() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      movies.addAll(
        await context.dependencies.searchRepository.getMovies(
          page: page++,
          text: searchText,
        ),
      );

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(pagination);
    getGenre();
  }

  @override
  void dispose() {
    controller
      ..removeListener(pagination)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.push(AppRouter.settings),
          icon: Icon(
            Icons.menu,
            color: context.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          context.lang.search,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextFormField(
                focusNode:
                    context.findAncestorStateOfType<HomeScreenState>()!.focus,
                style: context.textTheme.bodyMedium,
                onChanged: (value) => debouncer(() => onChange(value)),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: InputBorder.none,
                  hintText: context.lang.search,
                  hintStyle: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.primaryContainer,
                  ),
                  suffixIcon: SvgPicture.asset(
                    AppIcons.search2,
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 50,
                    maxHeight: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SearchBody(
                genres: genres,
                controller: controller,
                movies: movies,
                isTyped: searchText.isNotEmpty,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
