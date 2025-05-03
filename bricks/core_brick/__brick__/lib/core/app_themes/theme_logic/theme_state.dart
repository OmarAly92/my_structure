part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState({
    required this.isDark,
  });

  final bool isDark;

  @override
  List<Object> get props => [isDark];
}

final class ThemeChangedState extends ThemeState {
  const ThemeChangedState({
    required super.isDark,
  });

  @override
  List<Object> get props => [isDark];
}
