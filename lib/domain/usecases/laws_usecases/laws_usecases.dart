import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/models/models.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class LawsUsecase implements BaseUseCaseEmptyInput<List<LawsModel>> {
  final Repository repository;

  LawsUsecase({required this.repository});

  @override
  Future<Result<List<LawsModel>, FailureModel>> execute() async {
    return await repository.getLaws();
  }
}
