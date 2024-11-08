import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Clients/data/repositories/invoice_history_repository.dart';
import 'package:water/Returns/data/repositories/invoices_details_repository.dart';

import '../../../../Base/validator.dart';

class InvoicesDetailsBloc extends Bloc<AppEvent,AppState> with Validator {

  InvoicesDetailsBloc() :super(Start()) {
    on<GetInvoicesDetailsEvent>(_GetInvoicesDetails);
  }

  Future<void> _GetInvoicesDetails(GetInvoicesDetailsEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await invoicesDetailsRepository.getInvoiceDetails();
    print("response : ${response!.result!.details}");
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetInvoicesDetailsDone(result: response.result));
      } else {
        emit(GetInvoicesDetailsErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetHistoryInvoiceErrorLoading(message: e.toString()));
    }

  }

}

InvoicesDetailsBloc invoicesDetailsBloc = new InvoicesDetailsBloc();


