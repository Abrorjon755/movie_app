import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/common/style/app_icons.dart';
import 'package:movie_app/src/common/utils/extension_context.dart';
import 'package:movie_app/src/features/movie/screen/movie_screen.dart';
import 'package:movie_app/src/features/search/screen/search_screen.dart';
import 'package:movie_app/src/features/watch_list/screen/watch_list_screen.dart';

import '../../../common/l10n/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController controller;
  int value = 0;

  void pageChange(int v, BuildContext context) {
    setState(() {
      value = v;
      controller.animateToPage(
        v,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      if(value == 0){
        context.dependencies.homeRepository.getNowPlaying();
      }
      if (value == 2) {
        checkRegister(context);
      }
    });
  }

  Future? checkRegister(BuildContext context) {
    bool token = shp.getBool("token") ?? false;
    if (!token) {
      return showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          height: 200,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 10),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SizedBox(
                  width: 50,
                  height: 5,
                ),
              ),
              const SizedBox(height: 20),
              Text(S.of(context).pleaseRegister)
            ],
          ),
        ),
      );
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          switch (value) {
            0 => S.of(context).whatToWatch,
            1 => S.of(context).search,
            2 => S.of(context).watchList,
            _ => "",
          },
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          MovieScreen(),
          SearchScreen(),
          WatchListScreen(),
        ],
      ),
      bottomNavigationBar: ColoredBox(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: NavigationBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedIndex: value,
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStateColor.transparent,
            onDestinationSelected: (value) => pageChange(value, context),
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppIcons.home,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
                label: S.of(context).home,
                selectedIcon: SvgPicture.asset(
                  AppIcons.home,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppIcons.search,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
                label: S.of(context).search,
                selectedIcon: SvgPicture.asset(
                  AppIcons.search,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppIcons.save,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
                label: S.of(context).watchList,
                selectedIcon: SvgPicture.asset(
                  AppIcons.save,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
