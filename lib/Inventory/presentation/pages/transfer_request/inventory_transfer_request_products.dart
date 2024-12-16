import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Inventory/presentation/bloc/inventory_transfer_request_bloc.dart';
import 'package:water/Inventory/presentation/bloc/main_inventory_bloc.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/presentation/bloc/products_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/list_category_products.dart';

class InventoryTransferRequestProducts  extends StatefulWidget{
  CategoryData? categoryData;
  InventoryTransferRequestProducts({super.key,this.categoryData});
  @override
  State<StatefulWidget> createState() {
    return InventoryTransferRequestProductsState();
  }

}

class InventoryTransferRequestProductsState extends State<InventoryTransferRequestProducts>{
  @override
  void initState() {
    super.initState();
    Shared.order_products_list = [];
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MainInventoryBloc, AppState>(
      bloc: mainInventoryBloc,
      builder: (context, state) {
        print("ProductsUnderCategory ###state : ${state}");
        if (state is GetMainInventoryProductsUnderCategoryLoading) {
          return const LoadingPlaceHolder(
            shimmerType: ShimmerType.list,
            cellShimmerHeight: 50,
            shimmerCount: 10,
          );
        }
        else if (state is GetMainInventoryProductsUnderCategoryDone) {
          print("ProductsUnderCategory state : ${state.products!.length}");
          if(state.products != null && state.products!.isNotEmpty){
            return ListCategoryProducts(
              categoryData: widget.categoryData,
              products: state.products,
              isInventory: true,
              inventoryHeader: true,
            );
          }
          else{
            return Center(
              child: Text("لا توجد منتجات حاليا",
                style: TextStyle(color: kBlackColor),),
            );
          }

        } else if (state is GetMainInventoryProductsUnderCategoryErrorLoading) {
          return Center(
            child: Text("${state.message}"),
          );
        } else {
          print("sssssssssssssss");
          return Container();
        }

      },
    );
  }

}