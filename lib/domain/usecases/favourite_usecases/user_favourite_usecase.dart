import 'package:ebla/domain/models/favourite/favourite_models.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../usecases.dart';

class GetUserFavouriteUseCase
    implements BaseUseCase<String, List<FavouriteResponse>> {
  final Repository repository;

  GetUserFavouriteUseCase(this.repository);

  @override
  Future<Result<List<FavouriteResponse>, FailureModel>> execute(
          String id) async =>
      await repository.getUserFavourites(id);
}
