import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Clients/data/repositories/invoice_history_repository.dart';
import 'package:water/zebra/data/repositories/zebra_repository.dart';

import '../../../../Base/validator.dart';

class ZebraBloc extends Bloc<AppEvent,AppState> with Validator {

  ZebraBloc() :super(Start()) {
    on<GetZebraReceiptEvent>(_onGetZebraRecieptData);
  }

  Future<void> _onGetZebraRecieptData(GetZebraReceiptEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await zebraRepository.getReceiptData();
    print("response : ${response}");
    try{
      if (response != null ) {
        emit(GetZebraReceiptDone(recieptModel: response));
      } else {
        emit(GetZebraReceiptErrorLoading(message: ""));
      }
    }catch(e){
      emit(GetZebraReceiptErrorLoading(message: e.toString()));
    }

  }

}

ZebraBloc zebraBloc = new ZebraBloc();


