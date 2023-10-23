import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_bloc.freezed.dart';
part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc() : super(const _Initial()) {
    on<FaqEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
