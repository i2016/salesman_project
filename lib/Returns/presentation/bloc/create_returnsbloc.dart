import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Returns/data/repositories/create_returns_repository.dart';
import '../../../../Base/validator.dart';

class CreateReturnsBloc extends Bloc<AppEvent,AppState> with Validator {

  CreateReturnsBloc() :super(Start()) {
    on<CreateReturnsEvent>(_onCreateReturns);
  }

  Future<void> _onCreateReturns(CreateReturnsEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await createReturnsRepository.createReturns();
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(CreateReturnsDone(createReturnsModel: response));
      } else {
        emit(CreateReturnsErrorLoading(message: response.result!.message));
      }
    }catch(e){
      emit(CreateReturnsErrorLoading(message: e.toString()));
    }

  }

}

CreateReturnsBloc createReturnsBloc = new CreateReturnsBloc();


