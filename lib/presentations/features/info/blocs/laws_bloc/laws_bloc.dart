import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'laws_event.dart';
part 'laws_state.dart';
part 'laws_bloc.freezed.dart';

class LawsBloc extends Bloc<LawsEvent, LawsState> {
  LawsBloc() : super(_Initial()) {
    on<LawsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
