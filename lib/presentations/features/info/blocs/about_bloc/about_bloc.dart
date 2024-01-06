import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/cms_models/about/about_model.dart';
import 'package:ebla/domain/usecases/cms/cms_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_bloc.freezed.dart';
part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final AboutUsecase aboutUsecase;

  AboutBloc({required this.aboutUsecase}) : super(const AboutState.loading()) {
    on<AboutEvent>((event, emit) async {
      await event.map(
        getAbout: (value) async {
          emit(const AboutState.loading());
          final failureOrSuccess = await aboutUsecase.execute();
          failureOrSuccess.when((about) {
            emit(AboutState.loaded(about: about.data));
          }, (error) {
            emit(AboutState.error(message: error.message));
          });
        },
      );
    });
  }
}
