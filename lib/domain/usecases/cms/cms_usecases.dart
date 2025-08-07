import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/cms_models/about/about_model.dart';
import '../../models/cms_models/faq/faq_model.dart';
import '../../models/cms_models/news/news_model.dart';

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
