import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/task.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(SwitchState(switchValue: true));
    });
    on<SwitchOffEvent>((event, emit) {
      emit(SwitchState(switchValue: false));
    });
  }
}
