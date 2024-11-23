import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Visits/data/repositories/visits_repository.dart';

import '../../../../../Base/validator.dart';

class VisitsBloc extends Bloc<AppEvent,AppState> with Validator {

  VisitsBloc() :super(Start()) {
    on<GetTodayVisitsEvent>(_onTodayVisits);
    on<GetVisitDetailsEvent>(_onTodayVisitsDetails);
    on<GetVisitsHistoryEvent>(_onVisitsHistory);
  }

  Future<void> _onTodayVisits(GetTodayVisitsEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await visitsRepository.getTodayVisits();
    print("response : ${response!.result!.result}");
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GeTodayVisitsDone(visits: response.result?.result!));
      } else {
        emit(GetTodayVisitsErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetTodayVisitsErrorLoading(message: e.toString()));
    }

  }

  Future<void> _onTodayVisitsDetails(GetVisitDetailsEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await visitsRepository.getTodayVisitsDetails();
    print("response visitDetails: ${response!.result!.visitDetails![0].toJson()}");
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GeTodayVisitDetailsDone(visitDetails: response.result?.visitDetails!));
      } else {
        emit(GetTodayVisitDetailsErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetTodayVisitsErrorLoading(message: e.toString()));
    }

  }


  Future<void> _onVisitsHistory(GetVisitsHistoryEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await visitsRepository.getVisitsHistory();
    print("response : ${response!.result!.visitHistory}");
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetVisitsHistoryDone(visitsHistory: response.result?.visitHistory!));
      } else {
        emit(GetVisitsHistoryErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetVisitsHistoryErrorLoading(message: e.toString()));
    }

  }
}

VisitsBloc visitsBloc = new VisitsBloc();


