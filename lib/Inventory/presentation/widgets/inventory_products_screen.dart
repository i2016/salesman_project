import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Inventory/presentation/widgets/inventory_products_list_widget.dart';
import 'package:water/Visits/presentation/bloc/products_bloc.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/search_text_field.dart';

class InventoryProductsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InventoryProductsScreenState();
  }
}
class InventoryProductsScreenState extends State<InventoryProductsScreen>{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, AppState>(
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
            return InventoryProductsListWidget(
              products: state.products,
            );
          }
          else{
            return Center(
              child: Text("لا توجد منتجات حاليا",
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
    );
/*    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const SearchTextField(
          hintTextField: 'البحث عن منتج',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.014,
        ),
        const ImageNumberProductPriceContainer(),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child:  ReviewProductWaterItem(),
              );
            }),
      ],
    );*/
  }

}