part of 'controls_cubit.dart';

sealed class ControlsState extends Equatable {
  const ControlsState();
}

final class ControlsInitial extends ControlsState {
  @override
  List<Object> get props => [];
}
