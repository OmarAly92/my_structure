import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'controls_state.dart';

class ControlsCubit extends Cubit<ControlsState> {
  ControlsCubit() : super(ControlsInitial());
}
