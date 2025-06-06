import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/domain/usecases/laws_usecases/laws_usecases.dart';
// import 'package:ebla/domain/usecases/cms/cms_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'laws_bloc.freezed.dart';
part 'laws_event.dart';
part 'laws_state.dart';

class LawsBloc extends Bloc<LawsEvent, LawsState> {

  final LawsUsecase lawsUsecase;

  // final LawByIdUsecase lawByIdUsecase;
  static List<LawsModel> laws = [];
  final int limit = 20;

  LawsBloc({required this.lawsUsecase,
  //  required this.lawByIdUsecase
   })
      : super(const _Initial()) {
    on<LawsEvent>((event, emit) async {
      await event.map(
        updateSelectedCategories:(value)async{
  emit(state.copyWith(selectedCategories: value.categories));
        },
        getLaws: (value) async {
        emit(state.copyWith(
          isLoading: true,
          hasError: false,
          lawsResponse: [],
        ));

        final failureOrSuccessAllLaws = await lawsUsecase.execute();
        failureOrSuccessAllLaws.when((success) {
          laws.clear();
          laws.addAll(success);
          emit(
            state.copyWith(
              isLoading: false,
              hasError: false,
              lawsResponse: success,
            ),
          );
        }, (error) {
          emit(
            state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              lawsResponse: [],
            ),
          );
        });
      },
      //  getLawById: (value) async {
      //   emit(state.copyWith(
      //     isLoading: true,
      //     hasError: false,
      //     lawByIdResponse: const LawByIdResponse(),
      //   ));

      //   final failureOrSuccessLawById = await lawByIdUsecase.execute(value.id);
      //   failureOrSuccessLawById.when((success) {
      //     emit(
      //       state.copyWith(
      //         isLoading: false,
      //         hasError: false,
      //         lawByIdResponse: success,
      //       ),
      //     );
      //   }, (error) {
      //     emit(
      //       state.copyWith(
      //         isLoading: false,
      //         hasError: true,
      //         errorMessage: error.message,
      //         lawByIdResponse: const LawByIdResponse(),
      //       ),
      //     );
      //   });
      // });
    );});
  }}

  // LawsModel getLawModelById(int id) {
  //   return laws.firstWhere((item) => item.id == id,
  //       orElse: () => const LawsModel());
  // }
// }
