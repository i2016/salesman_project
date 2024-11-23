import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Visits/data/repositories/categories_repository.dart';

import '../../../../Base/validator.dart';

class CategoriesBloc extends Bloc<AppEvent,AppState> with Validator {

  CategoriesBloc() :super(Start()) {
    on<GetCategoriesEvent>(_onGetCategories);
  }

  Future<void> _onGetCategories(GetCategoriesEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await categoriesRepository.getCategories();
    print("response : ${response!.result!.categories}");
    try{
      if (response!.result!.statusCode! == 200 ) {
        emit(GetCategoriesDone(categories: response.result!.categories!));
      } else {
        emit(GetCategoriesErrorLoading(message: response.result?.message));
      }
    }catch(e){
      emit(GetCategoriesErrorLoading(message: e.toString()));
    }

  }

}

CategoriesBloc categoriesBloc = new CategoriesBloc();


