import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/presentation/bloc/products_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/list_category_products.dart';


class AvailableProductsScreenDetails extends StatelessWidget {
  CategoryData? categoryData;
  AvailableProductsScreenDetails({super.key,this.categoryData});

  @override
  Widget build(BuildContext context) {

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: BlocBuilder<ProductsBloc, AppState>(
            bloc: productsBloc,
            builder: (context, state) {
              if (state is Loading) {
                return const LoadingPlaceHolder(
                  shimmerType: ShimmerType.list,
                  cellShimmerHeight: 50,
                  shimmerCount: 10,
                );
              }
              else if (state is GetProductsDone) {
                if(state.products != null && state.products!.isNotEmpty){
                  return ListCategoryProducts(
                    categoryData: categoryData,
                    products: state.products,
                  );
                }
                else{
                  return Center(
                    child: Text("no_products".tr(),
                      style: TextStyle(color: kBlackColor),),
                  );
                }

              } else if (state is GetProductsErrorLoading) {
                return Center(
                  child: Text("${state.message}"),
                );
              } else {
                return Container();
              }

            },
          )
          ),
        );
  }
}
