import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Inventory/data/repositories/inventory_repository.dart';

import '../../../../Base/validator.dart';

class MainInventoryBloc extends Bloc<AppEvent,AppState> with Validator {

  MainInventoryBloc() :super(Start()) {
    on<GetMainInventoryProductsvent> (_onGetMainInventoryProducts);
    on<GetMainInventoryProductsUnderSpecficCategoryEvent> (_onGetMainInventoryProductsUnderSpecficCategory);

  }
  Future<void> _onGetMainInventoryProducts(GetMainInventoryProductsvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await inventoryRepository.getInventoryProducts(
category_id: "1"
    );
    print("GetMainInventoryProducts response : ");
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

  Future<void> _onGetMainInventoryProductsUnderSpecficCategory(GetMainInventoryProductsUnderSpecficCategoryEvent event,
      Emitter<AppState> emit) async {
    emit(GetMainInventoryProductsUnderCategoryLoading());
    var response = await inventoryRepository.getInventoryProducts(
category_id: await sharedPreferenceManager.readString(CachingKey.Category_ID)
    );
    print("GetMainInventoryProductsUnderCategory response : ${response!.result!.products!}");
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetMainInventoryProductsUnderCategoryDone(products: response.result!.products));
      } else {
        emit(GetMainInventoryProductsUnderCategoryErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetMainInventoryProductsUnderCategoryErrorLoading(message: e.toString()));
    }

  }
}

MainInventoryBloc mainInventoryBloc = new MainInventoryBloc();


