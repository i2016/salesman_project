import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Inventory/presentation/bloc/main_inventory_bloc.dart';
import 'package:water/Inventory/presentation/widgets/inventory_products_list_widget.dart';


class InventoryProductsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InventoryProductsScreenState();
  }
}
class InventoryProductsScreenState extends State<InventoryProductsScreen>{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainInventoryBloc, AppState>(
      bloc: mainInventoryBloc,
      builder: (context, state) {
        if (state is Loading) {
          return  LoadingPlaceHolder(
            shimmerType: ShimmerType.list,
            cellShimmerHeight: 50,
            shimmerCount: 10,
          );
        }
        else if (state is GetMainInventoryProductsDone) {
          if(state.products != null && state.products!.isNotEmpty){
            return InventoryProductsListWidget(
              products: state.products,
            );
          }
          else{
            return Center(
              child: Text("no_products".tr(),
                style: TextStyle(color: kBlackColor),),
            );
          }

        } else if (state is GetMainInventoryProductsErrorLoading) {
          return Center(
            child: Text("${state.message}"),
          );
        } else {
          return Container();
        }

      },
    );
  }

}