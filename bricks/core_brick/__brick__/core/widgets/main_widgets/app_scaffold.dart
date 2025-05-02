import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/utils/screen_size_utils.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final Widget? sidebar;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const AppScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.padding,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.floatingActionButtonLocation,
    this.sidebar,
  });

  @override
  Widget build(BuildContext context) {
    if (sidebar == null) {
      return Scaffold(
        appBar: appBar,
        backgroundColor: backgroundColor,
        body: Padding(padding: padding ?? EdgeInsets.zero, child: body),
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        drawer: drawer,
        endDrawer: endDrawer,
        floatingActionButton: floatingActionButton,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButtonLocation:
        floatingActionButtonLocation ?? FloatingActionButtonLocation.centerDocked,
      );
    }
    return Row(
      children: [
        if (context.isDesktop)
          Material(
            child: SizedBox(
              width: 300,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.sidebarBackground,
                ),
                child: sidebar,
              ),
            ),
          ),
        Expanded(
          child: Scaffold(
            appBar: appBar,
            backgroundColor: backgroundColor,
            body: Padding(padding: padding ?? EdgeInsets.zero, child: body),
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            drawer: drawer,
            endDrawer: endDrawer,
            floatingActionButton: floatingActionButton,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            floatingActionButtonLocation:
            floatingActionButtonLocation ?? FloatingActionButtonLocation.centerDocked,
          ),
        ),
      ],
    );
  }
}
