import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/domain/usecases/CMS/cms_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'laws_bloc.freezed.dart';
part 'laws_event.dart';
part 'laws_state.dart';

class LawsBloc extends Bloc<LawsEvent, LawsState> {
  final LawsUsecase lawsUsecase;
  LawsBloc({required this.lawsUsecase}) : super(const _Initial()) {
    on<LawsEvent>((event, emit) async {
      await event.map(getLaws: (value) async {
        emit(state.copyWith(
          isLoading: true,
          hasError: false,
          lawsResponse: const LawsResponse(),
        ));

        final failureOrSuccess = await lawsUsecase.execute();
        failureOrSuccess.when((success) {
          emit(
            state.copyWith(
              isLoading: false,
              hasError: false,
              lawsResponse: success,
            ),
          );
        }, (error) {
          emit(
            state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              lawsResponse: const LawsResponse(),
            ),
          );
        });
      });
    });
  }
}
