import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/router/app_router.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/utils/extension_context.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.child});

  final Widget child;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int page = 0;
  late final FocusNode focus;

  void pageChange(int v, BuildContext context) {
    switch (v) {
      case 0:
        context.go(AppRouter.movie);
      case 1:
        context.go(AppRouter.search);
      default:
        context.go(AppRouter.watchList);
    }
    setState(() {
      page = v;
    });
  }

  void onSearchPressed(int v) {
    setState(() {
      focus.requestFocus();
      pageChange(v, context);
    });
  }

  @override
  void initState() {
    super.initState();
    focus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: widget.child,
      bottomNavigationBar: ColoredBox(
        color: context.colorScheme.onPrimaryContainer,
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: NavigationBar(
            backgroundColor: context.colorScheme.primary,
            selectedIndex: page,
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStateColor.transparent,
            onDestinationSelected: (value) => pageChange(value, context),
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppIcons.home,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.primaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
                label: context.lang.home,
                selectedIcon: SvgPicture.asset(
                  AppIcons.home,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.onPrimaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppIcons.search,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.primaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
                label: context.lang.search,
                selectedIcon: SvgPicture.asset(
                  AppIcons.search,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.onPrimaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppIcons.save,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.primaryContainer,
                    BlendMode.srcATop,
                  ),
                ),
                label: context.lang.watchList,
                selectedIcon: SvgPicture.asset(
                  AppIcons.save,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.onPrimaryContainer,
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
