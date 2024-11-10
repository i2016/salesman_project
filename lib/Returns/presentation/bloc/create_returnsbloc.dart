import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Profile/data/repositories/profile_repository.dart';
import 'package:water/Visits/data/repositories/categories_repository.dart';
import 'package:water/Visits/data/repositories/create_order/create_order_repository.dart';
import 'package:water/Visits/data/repositories/today_visits_repository.dart';

import '../../../../Base/validator.dart';

class CreateReturnsBloc extends Bloc<AppEvent,AppState> with Validator {

  CreateReturnsBloc() :super(Start()) {
    on<CreateReturnsEvent>(_onCreateReturns);
  }

  Future<void> _onCreateReturns(CreateReturnsEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await createOrderRepository.createOrder();
    try{
      if (response!.statusCode! == 200 ) {
        emit(CreateReturnsDone(createOrderResponseModel: response));
      } else {
        emit(CreateReturnsErrorLoading(message: response.message));
      }
    }catch(e){
      emit(CreateReturnsErrorLoading(message: e.toString()));
    }

  }

}

CreateReturnsBloc createReturnsBloc = new CreateReturnsBloc();


