import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../usecases.dart';

class DeleteFavouriteUseCase implements BaseUseCase<int, bool> {
  final Repository repository;

  DeleteFavouriteUseCase(this.repository);

  @override
  Future<Result<bool, FailureModel>> execute(int body) async {
    return await repository.deleteFavourite(body);
  }
}
