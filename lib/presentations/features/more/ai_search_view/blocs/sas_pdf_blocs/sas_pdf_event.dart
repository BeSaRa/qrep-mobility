part of 'sas_pdf_bloc.dart';

@freezed
class SasPdfEvent with _$SasPdfEvent {
  const factory SasPdfEvent.getSasPdf(
      {required String request, required String fileName,}) = _GetSasPdf;
}
