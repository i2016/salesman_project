import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Visits/data/repositories/create_collection/collection_repository.dart';

import '../../../../Base/validator.dart';

class CreateCollectionBloc extends Bloc<AppEvent,AppState> with Validator {

  CreateCollectionBloc() :super(Start()) {
    on<CreateCollectionEvent>(_oncreateCollection);
  }

  Future<void> _oncreateCollection(CreateCollectionEvent event,
      Emitter<AppState> emit) async {
    emit(CreateCollectionLoading());
    try{
    var response = await collectionRepository.createCollection();

      if (response!.result!.statusCode! == 200 ) {
        emit(CreateCollectionDone(createCollectionResponseModel: response));
      } else {
        emit(CreateCollectionErrorLoading(message: response.result!.message));
      }
    }catch(e){
      emit(CreateOrderErrorLoading(message: e.toString()));
    }

  }

}

CreateCollectionBloc createCollectionBloc = new CreateCollectionBloc();


