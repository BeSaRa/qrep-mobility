import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/cms_models/news/news_model.dart';
import 'package:ebla/domain/usecases/CMS/cms_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUsecase newsUsecase;

  NewsBloc({required this.newsUsecase}) : super(const NewsState.loading()) {
    on<NewsEvent>((event, emit) async {
      await event.map(
        getNewsEvent: (value) async {
          emit(const NewsState.loading());
          final failureOrSuccess = await newsUsecase.execute();
          failureOrSuccess.when((news) {
            emit(NewsState.loaded(news: news.data));
          }, (error) {
            emit(NewsState.error(message: error.message));
          });
        },
      );
    });
  }
}
