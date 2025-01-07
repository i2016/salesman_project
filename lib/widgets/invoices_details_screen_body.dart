import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Returns/data/models/invoices_details_model.dart';
import 'package:water/Returns/data/models/returns_invoice_model.dart';
import 'package:water/Returns/presentation/bloc/invoices_details_bloc.dart';
import 'package:water/Returns/presentation/widgets/returns_add_product_widget.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/products_and_prices_invoices_details_screen.dart';
import 'package:water/widgets/image_number_product_price_container_invoices_details.dart';import 'package:water/widgets/search_text_field_invoices_details_screen.dart';
import 'package:water/widgets/water_item_invoices_details.dart';

import '../Base/common/dialogs.dart';

/*class InvoicesDetailsScreenBody extends StatelessWidget{
  InvoicesDetailsScreenBody({super.key,required this.invoice});

  final Invoice? invoice;
  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

       child: Scaffold(
        body: BlocBuilder<InvoicesDetailsBloc , AppState>(
          bloc: invoicesDetailsBloc,
          builder: (context , state){
            if(state is Loading){
              return const LoadingPlaceHolder(
                shimmerType: ShimmerType.list,
                cellShimmerHeight: 50,
                shimmerCount: 10,
              );
            }
            else if(state is GetInvoicesDetailsDone){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SearchTextFieldInvoicesDetailsScreen(
                          invoice: invoice,
                        ),
                        const ImageNumberProductPriceContainerInvoicesDetails(),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                      ),
                      child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.result!.details!.items!.length,
                            itemBuilder: (context , index){
                              return InkWell(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
                                          content: ReturnsAddProductWidget(
                                            item: state.result!.details!.items![index],
                                          )
                                      );
                                    },
                                  );
                                },
                                child: WaterItemInvoicesDetails(
                                  item: state.result!.details!.items![index],
                                ),
                              );
                            }
                        ),
                    )
                      ],
                    ),
                  ),

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
}*/


class InvoicesDetailsScreenBody extends StatefulWidget {
  InvoicesDetailsScreenBody({super.key, required this.invoice});

  final Invoice? invoice;

  @override
  _InvoicesDetailsScreenBodyState createState() => _InvoicesDetailsScreenBodyState();
}

class _InvoicesDetailsScreenBodyState extends State<InvoicesDetailsScreenBody> {
  final TextEditingController _searchController = TextEditingController();
  List<Item> _filteredProducts = [];
  List<Item> _allProducts = [];
  bool _isFilteringDone = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  void _searchProductsFunc(String query) {
    print("query : $query");
    Future.microtask(() {
      setState(() {
        if (query.isEmpty) {
          _filteredProducts = _allProducts; // Reset to show all visits when search is cleared
        } else {
          _filteredProducts = _allProducts
              .where((visit) =>
          visit.productName!.toLowerCase().contains(query.toLowerCase()))
              .toList();

        }
        _isFilteringDone = true; // Mark filtering as complete
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        body: BlocBuilder<InvoicesDetailsBloc, AppState>(
          bloc: invoicesDetailsBloc,
          builder: (context, state) {
            if (state is Loading) {
              return const LoadingPlaceHolder(
                shimmerType: ShimmerType.list,
                cellShimmerHeight: 50,
                shimmerCount: 10,
              );
            } else if (state is GetInvoicesDetailsDone) {
              _allProducts = state.result!.details!.items ?? [];
              final displayProducts =
              _isFilteringDone  ? _filteredProducts : _allProducts;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextFieldInvoicesDetailsScreen(
            invoice: widget.invoice,
          ),
          // Search TextField
          Container(
            width: double.infinity,
            height: MediaQuery
                .of(context)
                .orientation == Orientation.portrait
                ? MediaQuery
                .of(context)
                .size
                .height * 0.033
                : MediaQuery
                .of(context)
                .size
                .height * 0.054,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.5),
              child: TextField(
                controller: _searchController,
                cursorColor: const Color.fromARGB(255, 66, 64, 64),
                onChanged: _searchProductsFunc,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  prefixIcon: Image.asset(
                    'assets/images/search.png',
                    color: Colors.black,
                  ),
                  hintText: "search_for_product".tr(),
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 146, 155, 171),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.02,),
          const ImageNumberProductPriceContainerInvoicesDetails(),
          Expanded(
            child: displayProducts.isNotEmpty ?ListView.builder(
              itemCount: displayProducts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(33)),
                          content: ReturnsAddProductWidget(
                            item: displayProducts[index],
                          ),
                        );
                      },
                    );
                  },
                  child: WaterItemInvoicesDetails(
                    item: displayProducts[index],
                  ),
                );
              },
            ) : Padding(
              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.3),
              child: Center(
                child: Text("noDataAvailableNow".tr()),
              ),
            ),
          ),
        ],
      );

            } else if (state is GetReturnsInvoiceErrorLoading) {
              return Center(
                child: Text("${state.message}"),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
