import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Inventory/data/repositories/inventory_repository.dart';

import '../../../../Base/validator.dart';

class MainInventoryBloc extends Bloc<AppEvent,AppState> with Validator {

  MainInventoryBloc() :super(Start()) {
    on<GetMainInventoryProductsvent> (_onGetMainInventoryProducts);
  }
  Future<void> _onGetMainInventoryProducts(GetMainInventoryProductsvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await inventoryRepository.getInventoryProducts();
    print("response : ${response!.result!.products!}");
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetMainInventoryProductsDone(products: response.result!.products));
      } else {
        emit(GetMainInventoryProductsErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetMainInventoryProductsErrorLoading(message: e.toString()));
    }

  }

}

MainInventoryBloc mainInventoryBloc = new MainInventoryBloc();


