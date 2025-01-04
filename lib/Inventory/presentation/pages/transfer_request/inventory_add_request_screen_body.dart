import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Inventory/presentation/pages/transfer_request/inventory_add_request_categories.dart';
import 'package:water/Visits/presentation/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';

class InventoryAddRequestScreenBody extends StatefulWidget {
  InventoryAddRequestScreenBody({super.key});

  @override
  State<InventoryAddRequestScreenBody> createState() => _InventoryAddRequestScreenBodyState();
}

class _InventoryAddRequestScreenBodyState extends State<InventoryAddRequestScreenBody> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
          body:BlocBuilder<CategoriesBloc, AppState>(
      bloc: categoriesBloc,
      builder: (context, state) {
        if (state is Loading) {
          return const LoadingPlaceHolder(
            shimmerType: ShimmerType.list,
            cellShimmerHeight: 50,
            shimmerCount: 10,
          );
        }
        else if (state is GetCategoriesDone) {
          if(state.categories != null && state.categories!.isNotEmpty) {
            return  InventoryAddRequestCategories(
              categories: state.categories,
            );
          }
          else{
            return Center(
              child: Text("no_items_available".tr()),
            );
          }

        }
        else if (state is GetCategoriesErrorLoading) {
          return Center(
            child: Text("${state.message}"),
          );
        } else {
          return Container();
        }

      },
    )));
  }
}
