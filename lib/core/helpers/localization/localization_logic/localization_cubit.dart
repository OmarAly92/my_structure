import 'package:easy_localization/easy_localization.dart';
import 'package:my_structure/core/helpers/shared_preference/shared_preference_helper.dart';
import 'package:my_structure/core/helpers/shared_preference/shared_preference_keys.dart';
import 'package:my_structure/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit(BuildContext context) : super(LocalizationChanged()) {
    _loadLanguage(context);
  }

  Future<void> _loadLanguage(BuildContext context) async {
    final languageCode =
        PrefHelper.get(PrefKeys.currentLanguage) ?? AppStrings.enLanguage;
    await changeLanguage(
      context,
      locale: Locale(languageCode),
    );
  }

  Future<void> changeLanguage(
    BuildContext context, {
    required Locale locale,
  }) async {
    await context.setLocale(locale);
    await PrefHelper.save(
      PrefKeys.currentLanguage,
      locale.languageCode,
    );
  }
}
