part of 'sas_pdf_bloc.dart';


@freezed
class SasPdfState with _$SasPdfState {
  const factory SasPdfState.initial() = _Initial;
const factory SasPdfState.loading() = _Loading;
  const factory SasPdfState.done({required String response}) = _Done;
  const factory SasPdfState.error(String message) = _Error;
}
