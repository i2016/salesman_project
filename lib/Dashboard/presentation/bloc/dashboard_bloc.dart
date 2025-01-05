import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Clients/data/repositories/invoice_history_repository.dart';
import 'package:water/Dashboard/data/repositories/dashboard_repository.dart';
import 'package:water/Returns/data/repositories/invoices_details_repository.dart';

import '../../../../Base/validator.dart';

class DashboardBloc extends Bloc<AppEvent,AppState> with Validator {

  DashboardBloc() :super(Start()) {
    on<GetDashboardEvent>(_GetDashboardData);
  }

  Future<void> _GetDashboardData(GetDashboardEvent event,
      Emitter<AppState> emit) async {
    emit(DashboardLoading());
    var response = await dashboardRepository.getDashboardData();
    print("Dashboard response : ${response!.result}");
    try{
      if(response.result != null) {
        if (response.result!.statusCode! == 200) {
          emit(GetDashboardDone(model: response));
        } else {
          emit(GetDashboardErrorLoading(message: response.result?.message));
        }
      }else{
        emit(GetDashboardErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetDashboardErrorLoading(message: e.toString()));
    }

  }

}

DashboardBloc dashboardBloc = new DashboardBloc();
