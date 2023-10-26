import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/cms_models/news/news_model.dart';
import 'package:ebla/domain/usecases/CMS/cms_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_item_event.dart';
part 'news_item_state.dart';
part 'news_item_bloc.freezed.dart';

class NewsItemBloc extends Bloc<NewsItemEvent, NewsItemState> {
  final NewsByIdUsecase newsByIdUsecase;
  NewsItemBloc({required this.newsByIdUsecase})
      : super(const NewsItemState.loading()) {
    on<NewsItemEvent>((event, emit) async {
      await event.map(
        getNewsItem: (value) async {
          emit(const NewsItemState.loading());

          final failurOrSuccess = await newsByIdUsecase.execute((id: value.id));
          failurOrSuccess.when((item) {
            emit(NewsItemState.success(item: item));
          }, (error) {
            emit(NewsItemState.error(message: error.message));
          });
        },
      );
    });
  }
}
