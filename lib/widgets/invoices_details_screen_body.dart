import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/App/presentation/widgets/Drawer/good_returns_return_product_drawer.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Returns/presentation/bloc/invoices_details_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/products_and_prices_invoices_details_screen.dart';
import 'package:water/widgets/image_number_product_price_container_invoices_details.dart';import 'package:water/widgets/search_text_field_invoices_details_screen.dart';
import 'package:water/widgets/water_item_invoices_details.dart';

class InvoicesDetailsScreenBody extends StatelessWidget{
  InvoicesDetailsScreenBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
       child: Scaffold(
         endDrawer: const GoodReturnsReturnProductDrawer(),
        body: BlocBuilder<InvoicesDetailsBloc , AppState>(
          bloc: invoicesDetailsBloc,
          builder: (context , state){
            if(state is Loading){
              return const LoadingPlaceHolder(
                shimmerType: ShimmerType.list,
                cellShimmerHeight: 50,
                shimmerCount: 10,
              );
            }else if(state is GetInvoicesDetailsDone){

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SearchTextFieldInvoicesDetailsScreen(),
                        const ImageNumberProductPriceContainerInvoicesDetails(),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context , index){

                              return const WaterItemInvoicesDetails();
                            }
                        ),
                      ],
                    ),
                  ),
                  const ProductsAndPricesInvoicesDetailsScreen()
                ],
              );
            }else if(state is GetReturnsInvoiceErrorLoading){
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


