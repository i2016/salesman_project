import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Inventory/data/repositories/inventory_repository.dart';

import '../../../../Base/validator.dart';

class InventoryTransferRequestBloc extends Bloc<AppEvent,AppState> with Validator {

  InventoryTransferRequestBloc() :super(Start()) {
    on<InventoryTransferRequestEvent>(_onTransferRequest);
    on<SalesRemainingLimitEvent> (_onSalesRemainingLimit);
    on<GetTransferRequestsHistoryEvent>(_onGetTransferRequestsHistory);
    on<GetTransferRequestsDetailsEvent> (_onGetTransferRequestsDetails);
  }

  Future<void> _onTransferRequest(InventoryTransferRequestEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await inventoryRepository.transferRequest();
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(TransferRequestDone(inventoryTransferRequestResposneModel: response));
      } else {
        emit(TransferRequestErrorLoading(message: response.result!.message));
      }
    }catch(e){
      emit(TransferRequestErrorLoading(message: e.toString()));
    }

  }

  Future<void> _onSalesRemainingLimit(SalesRemainingLimitEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await inventoryRepository.salesRemainingLimit();
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(SalesRemainingLimitDone(salesRemainingLimitModel: response));
      } else {
        emit(SalesRemainingLimitErrorLoading(message: response.result!.message));
      }
    }catch(e){
      emit(SalesRemainingLimitErrorLoading(message: e.toString()));
    }

  }

  Future<void> _onGetTransferRequestsHistory(GetTransferRequestsHistoryEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await inventoryRepository.getTransferRequestsHistory();
    print("response : ${response!.result!.transferRequests!}");
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetTransferRequestsHistoryDone(transferRequests: response.result!.transferRequests));
      } else {
        emit(GetTransferRequestsHistoryErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetTransferRequestsHistoryErrorLoading(message: e.toString()));
    }

  }


  Future<void> _onGetTransferRequestsDetails(GetTransferRequestsDetailsEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await inventoryRepository.getTransferRequestsDetails();
    print("response : ${response!.result!.transferRequestsDetails!}");
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetTransferRequestsDetailsDone(transferRequestsDetails: response.result!.transferRequestsDetails));
      } else {
        emit(GetTransferRequestsDetailsErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetTransferRequestsDetailsErrorLoading(message: e.toString()));
    }

  }
}

InventoryTransferRequestBloc inventoryTransferRequestBloc = new InventoryTransferRequestBloc();


