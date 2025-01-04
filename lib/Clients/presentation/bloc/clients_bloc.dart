import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Clients/data/repositories/clients_repository.dart';
import 'package:water/Clients/data/repositories/invoice_history_repository.dart';

import '../../../../Base/validator.dart';

class ClientsBloc extends Bloc<AppEvent,AppState> with Validator {

  ClientsBloc() :super(Start()) {
    on<GetAllClientsEvent>(_onGetAllClients);
    on<GetClientAddRequestsEvent>(_onGetClientAddRequests);
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
}

ClientsBloc clientsBloc = new ClientsBloc();


