import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_structure/core/app_routes/app_router.dart';
import 'package:my_structure/core/app_routes/routes_strings.dart';
import 'package:my_structure/core/app_themes/theme_logic/theme_cubit.dart';
import 'package:my_structure/core/app_themes/themes/app_themes.dart';
import 'package:my_structure/core/helpers/localization/localization_logic/localization_cubit.dart';
import 'package:my_structure/core/utils/app_strings.dart';
import 'package:my_structure/core/widgets/failure_widgets/custom_flutter_error_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ThemeCubit()),
            BlocProvider(create: (context) => LocalizationCubit(context)),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: AppStrings.appName,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
                theme: AppThemes.light(),
                darkTheme: AppThemes.dark(),
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: RoutesStrings.homeScreen,
                builder: (context, child) {
                  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                    return CustomFlutterErrorWidget(errorDetails: errorDetails);
                  };
                  return child!;
                },
              );
            },
          ),
        );
      },
    );
  }
}
