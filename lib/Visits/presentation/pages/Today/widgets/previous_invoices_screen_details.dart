import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Returns/data/models/returns_invoice_model.dart';
import 'package:water/Returns/presentation/bloc/returns_invoice_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/products_and_prices_previous_invoices_screen.dart';
import 'package:water/index.dart';
import 'package:water/widgets/drawer_previous_invoices_screen.dart';
import 'package:water/widgets/search_text_field_previous_invoices_screen.dart';
import 'package:water/widgets/water_item_previous_invoices.dart';

class PreviousInvoicesScreenDetails extends StatelessWidget {
  PreviousInvoicesScreenDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          endDrawer: const DrawerPreviousInvoicesScreen(),
          body: BlocBuilder<ReturnsInvoiceBloc , AppState>(
            bloc: returnsInvoiceBloc,
            builder: (context , state){
              if(state is Loading){
                return const LoadingPlaceHolder(
                  shimmerType: ShimmerType.list,
                  cellShimmerHeight: 50,
                  shimmerCount: 10,
                );
              }else if(state is GetReturnsInvoiceDone){
                List<Invoice> returnInvoices = state.invoiceResult!.invoices!.where((element) => element.type == "invoice").toList();
                print("returnInvoices : ${returnInvoices}");
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchTextFieldPreviousInvoicesScreen(),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: returnInvoices.length,
                                itemBuilder: (context, index) {
                                  return WaterItemPreviousInvoices(
                                      saleName:   'مبيعات ${returnInvoices[index].amountTotal?? 500} ر.س',
                                      pill: 'فاتورة رقم ${returnInvoices[index].invoiceId?? 500}',
                                      date: 'اصدار بتاريخ ${returnInvoices[index].invoiceDate?? 500}',
                                      icon: 'assets/images/marketImage.png',
                                      color: Color(0xff0056C9),
                                      textIcon: '${returnInvoices[index].itemsCount?? 500} منتج',
                                    invoice: returnInvoices[index],

                                  );
                                }),
                          ],
                        ),
                      ),
                    ),

                    const ProductsAndPricesPreviousInvoicesScreen()
                  ],
                );
              }else if(state is GetReturnsInvoiceErrorLoading){
                return Center(
                  child: Text("${state.message}"),
                );
              }else{
                return Container();
              }
            },
          ),
          ),
        );
  }
}
