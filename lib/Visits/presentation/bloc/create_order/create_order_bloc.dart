import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Profile/data/repositories/profile_repository.dart';
import 'package:water/Visits/data/repositories/categories_repository.dart';
import 'package:water/Visits/data/repositories/create_order/create_order_repository.dart';

import '../../../../Base/validator.dart';

class CreateOrderBloc extends Bloc<AppEvent,AppState> with Validator {

  CreateOrderBloc() :super(Start()) {
    on<CreateOrderEvent>(_onCreateOrder);
  }

  Future<void> _onCreateOrder(CreateOrderEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await createOrderRepository.createOrder();
    
    try{
      if (response!.statusCode! == 200 ) {

        emit(CreateOrderDone(createOrderResponseModel: response));
      } else {
        emit(CreateOrderErrorLoading(message: response.message));
      }
    }catch(e){
      emit(CreateOrderErrorLoading(message: e.toString()));
    }

  }

}

CreateOrderBloc createOrderBloc = new CreateOrderBloc();


