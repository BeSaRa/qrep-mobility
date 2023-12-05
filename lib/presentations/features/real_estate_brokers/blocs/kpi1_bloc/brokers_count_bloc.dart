import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/requests/broker_requests/request_broker_values.dart';

part 'brokers_count_bloc.freezed.dart';
part 'brokers_count_event.dart';
part 'brokers_count_state.dart';

class BrokersCountBloc extends Bloc<BrokersCountEvent, BrokersCountState> {
  BrokersCountBloc() : super(const BrokersCountState.initial()) {
    on<BrokersCountEvent>((event, emit) {});
  }
}
