import 'package:my_structure/core/app_routes/routes_strings.dart';
import 'package:my_structure/core/utils/app_strings.dart';
import 'package:my_structure/core/utils/service_locator.dart';
import 'package:my_structure/feature/home/presentation/controls_screen/ui/controls_screen.dart';
import 'package:my_structure/feature/home/presentation/home_screen/logic/home_cubit.dart';
import 'package:my_structure/feature/home/presentation/home_screen/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesStrings.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => sl<HomeCubit>(),
              child: HomeScreen(),
            );
          },
        );
      case RoutesStrings.controlsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return ControlsScreen();
          },
        );
    }
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        );
      },
    );
  }
}
