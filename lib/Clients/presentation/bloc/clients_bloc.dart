import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Clients/data/repositories/clients_repository.dart';
import 'package:water/Clients/data/repositories/invoice_history_repository.dart';

import '../../../../Base/validator.dart';

class ClientsBloc extends Bloc<AppEvent,AppState> with Validator {

  ClientsBloc() :super(Start()) {
    on<GetAllClientsEvent>(_onGetAllClients);
    on<GetClientAddRequestsEvent>(_onGetClientAddRequests);
    on<AddClientEvent>(_onAddClient);
  }
  Future<void> _onAddClient(AddClientEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await clientsRepository.addClient();

    try{
      if (response!.result != null &&  response.result?.statusCode! == 200 ) {
        print("response.result?! : ${response.result}");
        emit(AddClientDone(addClientResponseModel: response));
      } else {
        emit(AddClientErrorLoading(message: response.result == null ? '' : response.result?.message));
      }
    }catch(e){
      emit(AddClientErrorLoading(message: e.toString()));
    }

  }


  Future<void> _onGetAllClients(GetAllClientsEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await clientsRepository.getAllClients();
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetAllClientsDone(clients: response.result?.clients));
      } else {
        emit(GetAllClientsErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetAllClientsErrorLoading(message: e.toString()));
    }

  }

  Future<void> _onGetClientAddRequests(GetClientAddRequestsEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await clientsRepository.getClientAddRequest();
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetClientAddRequestsDone(model: response));
      } else {
        emit(GetClientAddRequestsErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetClientAddRequestsErrorLoading(message: e.toString()));
    }

  }

  void resetClientData(){
    //Add Merchant
    Shared.addMerchantName= '';
    Shared.addMerchantPhone= '';
    Shared.addMerchantEmail= '';

    //Add Store
    Shared.addStoreName= '';
    Shared.addStoreVatNumber= '';
    Shared.addStoreRegisterationNumber= '';
    Shared.addStoreWebsite= '';

//Add Location
    Shared.addStoreLocationCity= 0;
    Shared.addStoreLocationRegion= '';
    Shared.addStoreLocationPostCode= '';
    Shared.addStoreLocationStreet= '';
    Shared.addStoreLocationBuildingNo= '';
    Shared.addStoreLocationLatitude= '';
    Shared.addStoreLocationLongtitude= '';
  }

  bool validateAddClient(){
    return Shared.addStoreName.isNotEmpty
        && Shared.addMerchantEmail.isNotEmpty
        && Shared.addMerchantName.isNotEmpty
        && Shared.addMerchantPhone.isNotEmpty
        && Shared.addStoreLocationCity != 0;
  }
}

ClientsBloc clientsBloc = new ClientsBloc();


