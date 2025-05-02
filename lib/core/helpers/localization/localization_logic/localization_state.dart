part of 'localization_cubit.dart';

sealed class LocalizationState extends Equatable {
  const LocalizationState();
}

final class LocalizationInitial extends LocalizationState {
  const LocalizationInitial();

  @override
  List<Object> get props => [];
}

final class LocalizationChanged extends LocalizationState {
  const LocalizationChanged();

  @override
  List<Object> get props => [];
}
