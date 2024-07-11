import 'package:ebla/domain/models/favourite/favourite_models.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../usecases.dart';

class UpdateFavouriteUseCase
    implements BaseUseCase<FavouriteResponse, FavouriteResponse> {
  final Repository repository;

  UpdateFavouriteUseCase(this.repository);

  @override
  Future<Result<FavouriteResponse, FailureModel>> execute(
      FavouriteResponse body) async {
    return await repository.updateFavourite(body);
  }
}
