import 'package:my_structure/core/helpers/shared_preference/preference_helper.dart';
import 'package:my_structure/core/helpers/shared_preference/preference_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeChangedState(isDark: false)) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDark = PrefHelper.get(PrefKeys.currentTheme) ?? false;
    emit(ThemeChangedState(isDark: isDark));
  }

  Future<void> changeTheme(bool isDark) async {
    // AppDynamicColors.isDark = null;
    await PrefHelper.save(PrefKeys.currentTheme, isDark);
    emit(ThemeChangedState(isDark: isDark));
  }

  Future<void> toggleTheme() async {
    final currentTheme = state.isDark;
    await changeTheme(!currentTheme);
  }
}
