import 'package:ebla/domain/usecases/ai_search/get_ai_search_pdf_url_usecase.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sas_pdf_bloc.freezed.dart';
part 'sas_pdf_event.dart';
part 'sas_pdf_state.dart';

class SasPdfBloc extends Bloc<SasPdfEvent, SasPdfState> {
  final GetAiSearchPdfUrlUsecase getAiSearchPdfUrlUsecase;

  SasPdfBloc(
    this.getAiSearchPdfUrlUsecase,
  ) : super(const SasPdfState.initial()) {
    on<SasPdfEvent>((SasPdfEvent event, emit) async {
       emit(const SasPdfState.loading());
      await event.map(
        getSasPdf: (value) async {
          final requestBody = value.request;
          final failureOrSuccess = await getAiSearchPdfUrlUsecase.execute(requestBody);
          await failureOrSuccess.when((success) async {
            emit(SasPdfState.done(
              response: success,
            ));
          }, (error) {
            emit(SasPdfState.error(error.message??error.detail??AppStrings().defaultError));
          });
        },
      );
    });
  }
}
