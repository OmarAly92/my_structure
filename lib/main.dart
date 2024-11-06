import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_structure/core/helpers/localization/app_localization.dart';
import 'package:my_structure/core/helpers/observers/bloc_observer.dart';
import 'package:my_structure/core/helpers/shared_preference/shared_preference_helper.dart';
import 'package:my_structure/core/utils/app_assets.dart';
import 'package:my_structure/core/utils/service_locator.dart';
import 'package:my_structure/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ServiceLocator.inIt(),
    PrefHelper.init(),
  ]);

  Bloc.observer = AppBlocObserver();

  /// Set the Orientation of the App to be Portrait Only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.locales,
      path: AppAsset.translations,
      fallbackLocale: AppLocalization.locales.first,
      child: const MyApp(),
    ),
  );
}

/// To Generate App Icon from [icons_launcher] package
/// dart run icons_launcher:create --path icons_launcher.yaml

/// To Run Build Runner
/// fvm dart run build_runner build --delete-conflicting-outputs

/// To Generate Localizations
/// flutter pub run easy_localization:generate -S assets/translations -O lib/core/helpers/localization -o locale_keys.g.dart -f keys

/// Add api-keys.json file in the root of the project
/// Don't Forget To add Additional run argus: --dart-define-from-file=api-keys.json
