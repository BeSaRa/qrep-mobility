import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/models/requests/sell_requests/request_sell_values.dart';
import '../../../../../domain/usecases/sell_usecases/top_values/top_values_sell_usecases.dart';

part 'topvalues_event.dart';
part 'topvalues_state.dart';
part 'topvalues_bloc.freezed.dart';

class TopvaluesBloc extends Bloc<TopvaluesEvent, TopvaluesState> {
  final CountTransictionNumberUseCase countTransictionNumberUseCase;
  final CountUnitPriceUseCase countUnitPriceUseCase;
  final CountTransictionsValueUseCase countTransictionsValueUseCase;
  final CountAreasUseCase countAreasUseCase;
  final RealStateNumberUseCase realStateNumberUseCase;
  final RealStateNumberMeterUseCase realStateNumberMeterUseCase;
  int index = 1;
  TopvaluesBloc(
      {required this.countTransictionNumberUseCase,
      required this.countUnitPriceUseCase,
      required this.countTransictionsValueUseCase,
      required this.countAreasUseCase,
      required this.realStateNumberUseCase,
      required this.realStateNumberMeterUseCase})
      : super(const _Initial()) {
    on<TopvaluesEvent>((event, emit) async {
      await event.map(
        countTransictionNumberEvent: (value) async {
          index = 1;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await countTransictionNumberUseCase.execute(value.request);
          failureOrSuccess.when((success) {
            print("i get success in sell count transiction number");
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: false,
                listResponse: success));
          }, (error) {
            print("i get error in sell count transiction number");
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: true,
                errorMessage: error.message,
                listResponse: []));
          });
        },
        countUnitPriceEvent: (value) async {
          index = 2;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await countUnitPriceUseCase.execute(value.request);
          failureOrSuccess.when((success) {
            print("i get success in sell count unite price");
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: false,
                listResponse: success));
          }, (error) {
            print("i get error in sell count unite price");
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: true,
                errorMessage: error.message,
                listResponse: []));
          });
        },
        countTransictionsValueEvent: (value) async {
          index = 3;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await countTransictionsValueUseCase.execute(value.request);
          failureOrSuccess.when((success) {
            print("i get success in sell count transiction value");
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: false,
                listResponse: success));
          }, (error) {
            print("i get error in sell count transiction value");
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: true,
                errorMessage: error.message,
                listResponse: []));
          });
        },
        countAreasEvent: (value) async {
          index = 4;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await countAreasUseCase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: false,
                listResponse: success));
          }, (error) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: true,
                errorMessage: error.message,
                listResponse: []));
          });
        },
        realStateNumberEvent: (value) async {
          index = 5;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await realStateNumberUseCase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
              isLoading: false,
              isHasErrorContract: false,
              listResponse: success,
              // listResponse: [],
            ));
          }, (error) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: true,
                errorMessage: error.message,
                listResponse: []));
          });
        },
        realStateNumberMeterEvent: (value) async {
          index = 6;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await realStateNumberMeterUseCase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
              isLoading: false,
              isHasErrorContract: false,
              listResponse: success,
              // listResponse: [],
            ));
          }, (error) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: true,
                errorMessage: error.message,
                listResponse: []));
          });
        },
      );
    });
  }
}
