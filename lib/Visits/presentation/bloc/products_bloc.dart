import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Profile/data/repositories/profile_repository.dart';
import 'package:water/Visits/data/repositories/categories_repository.dart';
import 'package:water/Visits/data/repositories/products_repository.dart';

import '../../../../Base/validator.dart';

class ProductsBloc extends Bloc<AppEvent,AppState> with Validator {

  ProductsBloc() :super(Start()) {
    on<GetProductsEvent>(_onGetProducts);
  }

  Future<void> _onGetProducts(GetProductsEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await productsRepository.getProducts(

    );
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetProductsDone(products: response.result!.products!));
      } else {
        emit(GetProductsErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetProductsErrorLoading(message: e.toString()));
    }

  }

}

ProductsBloc productsBloc = new ProductsBloc();


