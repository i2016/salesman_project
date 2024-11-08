import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Clients/data/repositories/invoice_history_repository.dart';
import 'package:water/Profile/data/repositories/profile_repository.dart';
import 'package:water/Visits/data/repositories/categories_repository.dart';
import 'package:water/Visits/data/repositories/today_visits_repository.dart';

import '../../../../Base/validator.dart';

class ReturnsInvoiceBloc extends Bloc<AppEvent,AppState> with Validator {

  ReturnsInvoiceBloc() :super(Start()) {
    on<GetReturnsInvoiceEvent>(_GetReturnsInvoice);
  }

  Future<void> _GetReturnsInvoice(GetReturnsInvoiceEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await invoiceHistoryRepository.getInvoiceHistory();
    print("response : ${response!.invoiceResult!.invoices}");
    try{
      if (response!.invoiceResult!.statusCode! == 200 ) {
        emit(GetHistoryInvoiceDone(invoiceResult: response.invoiceResult));
      } else {
        emit(GetHistoryInvoiceErrorLoading(message: response.invoiceResult?.message));
      }
    }catch(e){
      emit(GetHistoryInvoiceErrorLoading(message: e.toString()));
    }

  }

}

ReturnsInvoiceBloc returnsInvoiceBloc = new ReturnsInvoiceBloc();


