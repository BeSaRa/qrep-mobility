import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../models/favourite/favourite_models.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class CreateFavouriteUseCase
    implements BaseUseCase<FavouriteResponse, FavouriteResponse> {
  final Repository repository;

  CreateFavouriteUseCase(this.repository);

  @override
  Future<Result<FavouriteResponse, FailureModel>> execute(
      FavouriteResponse body) async {
    return await repository.createFavourite(body);
  }
}
