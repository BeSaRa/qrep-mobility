import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/models.dart';

class AboutUsecase implements BaseUseCaseEmptyInput<AboutResponse> {
  final Repository repository;

  AboutUsecase(this.repository);

  @override
  Future<Result<AboutResponse, FailureModel>> execute() async {
    return await repository.getAbout();
  }
}

class NewsUsecase implements BaseUseCaseEmptyInput<List<NewsModel>> {
  final Repository repository;

  NewsUsecase(this.repository);

  @override
  Future<Result<List<NewsModel>, FailureModel>> execute() async {
    return await repository.getNews();
  }
}

class NewsByIdUsecase implements BaseUseCase<({int id}), NewsByIdResponse> {
  final Repository repository;

  NewsByIdUsecase(this.repository);

  @override
  Future<Result<NewsByIdResponse, FailureModel>> execute(
      ({int id}) input) async {
    return await repository.getNewsById(id: input.id);
  }
}

// class LawsUsecase implements BaseUseCase<int, LawsResponse> {
//   final Repository repository;

//   LawsUsecase(this.repository);

//   @override
//   Future<Result<LawsResponse, FailureModel>> execute(int limit) async {
//     return await repository.getLaws(limit: limit);
//   }
// }

class LawByIdUsecase implements BaseUseCase<int, LawByIdResponse> {
  final Repository repository;

  LawByIdUsecase(this.repository);

  @override
  Future<Result<LawByIdResponse, FailureModel>> execute(int id) async {
    return await repository.getLawById(id);
  }
}

class FaqUsecase implements BaseUseCase<int, FaqResponse> {
  final Repository repository;

  FaqUsecase(this.repository);

  @override
  Future<Result<FaqResponse, FailureModel>> execute(int limit) async {
    return await repository.getFaq(limit);
  }
}

class GetCmsTokenUseCase implements BaseUseCaseEmptyInput<String> {
  final Repository repository;

  GetCmsTokenUseCase(this.repository);

  @override
  Future<Result<String, FailureModel>> execute() async {
    return await repository.getCmsToken();
  }
}
