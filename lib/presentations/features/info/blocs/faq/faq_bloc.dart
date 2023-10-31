import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/cms_models/faq/faq_model.dart';
import 'package:ebla/domain/usecases/CMS/cms_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_bloc.freezed.dart';
part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final FaqUsecase faqUsecase;
  final int limit = 10;
  FaqBloc({required this.faqUsecase}) : super(const _Initial(isLoading: true)) {
    on<FaqEvent>((event, emit) async {
      await event.map(getFaq: (value) async {
        emit(state.copyWith(
          isLoading: true,
          hasError: false,
          faqResponse: const FaqResponse(),
        ));
        final failureOrSuccessFaq = await faqUsecase.execute(limit);
        failureOrSuccessFaq.when((success) {
          emit(
            state.copyWith(
              isLoading: false,
              hasError: false,
              faqResponse: success,
            ),
          );
        }, (error) {
          emit(
            state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              faqResponse: const FaqResponse(),
            ),
          );
        });
      });
      // TODO: implement event handler
    });
  }
}
