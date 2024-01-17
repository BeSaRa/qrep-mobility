import 'package:ebla/domain/models/mrtgage_models/mortgage_models.dart';
import 'package:ebla/domain/models/requests/mortgage_requests/request_mortgage_values.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class MortgageTransactionUseCase
    implements BaseUseCase<RequestMortgageValues, MortgageTransactionResponse> {
  final Repository repository;

  MortgageTransactionUseCase(this.repository);

  @override
  Future<Result<MortgageTransactionResponse, FailureModel>> execute(
      RequestMortgageValues input) async {
    return await repository.getMortgageTransactions(input);
  }
}
