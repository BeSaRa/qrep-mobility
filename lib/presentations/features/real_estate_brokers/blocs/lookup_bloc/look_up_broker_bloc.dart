import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'look_up_broker_bloc.freezed.dart';
part 'look_up_broker_event.dart';
part 'look_up_broker_state.dart';

class LookUpBrokerBloc extends Bloc<LookUpBrokerEvent, LookUpBrokerState> {
  LookUpBrokerBloc() : super(const LookUpBrokerState.initial()) {
    on<LookUpBrokerEvent>((event, emit) {});
  }
}
