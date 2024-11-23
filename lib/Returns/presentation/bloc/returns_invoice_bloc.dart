import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Returns/data/repositories/returns_invoice_repository.dart';

import '../../../../Base/validator.dart';

class ReturnsInvoiceBloc extends Bloc<AppEvent,AppState> with Validator {

  ReturnsInvoiceBloc() :super(Start()) {
    on<GetReturnsInvoiceEvent>(_GetReturnsInvoice);
  }

  Future<void> _GetReturnsInvoice(GetReturnsInvoiceEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await returnsInvoiceRepository.getReturnsInvoice();
    print("response : ${response!.invoiceResult!.invoices}");
    try{
      if (response!.invoiceResult!.statusCode! == 200 ) {
        emit(GetReturnsInvoiceDone(invoiceResult: response.invoiceResult));
      } else {
        emit(GetReturnsInvoiceErrorLoading(message: response.invoiceResult?.message));
      }
    }catch(e){
      emit(GetReturnsInvoiceErrorLoading(message: e.toString()));
    }

  }

}

ReturnsInvoiceBloc returnsInvoiceBloc = new ReturnsInvoiceBloc();


