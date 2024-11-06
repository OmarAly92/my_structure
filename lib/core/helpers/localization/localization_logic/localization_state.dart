part of 'localization_cubit.dart';

sealed class LocalizationState extends Equatable {
  const LocalizationState();
}

final class LocalizationChanged extends LocalizationState {
  const LocalizationChanged();

  @override
  List<Object> get props => [];
}
