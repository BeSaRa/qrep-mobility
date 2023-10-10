import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_contracts_state.dart';
part 'total_contracts_event.dart';
part 'total_contracts_bloc.freezed.dart';

class TotalContractsBloc extends Bloc<TotalContractsEvent,TotalContractsState>{
  TotalContractsBloc() : super(const TotalContractsState.initial()){
    
  }
}