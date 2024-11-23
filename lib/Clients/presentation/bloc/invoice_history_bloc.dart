import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Clients/data/repositories/invoice_history_repository.dart';

import '../../../../Base/validator.dart';

class InvoiceHistoryBloc extends Bloc<AppEvent,AppState> with Validator {

  InvoiceHistoryBloc() :super(Start()) {
    on<GetHistoryInvoiceEvent>(_onGetHistoryInvoices);
  }

  Future<void> _onGetHistoryInvoices(GetHistoryInvoiceEvent event,
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

InvoiceHistoryBloc invoiceHistoryBloc = new InvoiceHistoryBloc();


