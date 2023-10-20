import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/domain/models/translations_model/translations_model.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../data/newtwok/failure_model/failure.dart';

class TranslationsUseCase implements BaseUseCase<int, TranslationsModel> {
  final Repository repository;

  TranslationsUseCase(this.repository);

  @override
  Future<Result<TranslationsModel, FailureModel>> execute(int input) async {
    return await repository.getTranslations(input);
  }
}
