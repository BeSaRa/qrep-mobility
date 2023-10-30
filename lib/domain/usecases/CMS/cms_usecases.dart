import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/cms_models/about/about_model.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/domain/models/cms_models/news/news_model.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/src/result.dart';

class AboutUsecase implements BaseUseCaseEmptyInput<AboutResponse> {
  final Repository repository;

  AboutUsecase(this.repository);
  @override
  Future<Result<AboutResponse, FailureModel>> execute() async {
    return await repository.getAbout();
  }
}

class NewsUsecase implements BaseUseCaseEmptyInput<NewsResponse> {
  final Repository repository;

  NewsUsecase(this.repository);

  @override
  Future<Result<NewsResponse, FailureModel>> execute() async {
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

class LawsUsecase implements BaseUseCase<int, LawsResponse> {
  final Repository repository;

  LawsUsecase(this.repository);

  @override
  Future<Result<LawsResponse, FailureModel>> execute(int limit) async {
    return await repository.getLaws(limit: limit);
  }
}

class LawByIdUsecase implements BaseUseCase<int, LawByIdResponse> {
  final Repository repository;

  LawByIdUsecase(this.repository);

  @override
  Future<Result<LawByIdResponse, FailureModel>> execute(int id) async {
    return await repository.getLawById(id);
  }
}
