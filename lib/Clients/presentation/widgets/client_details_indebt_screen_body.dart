import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Clients/presentation/bloc/invoice_history_bloc.dart';
import 'package:water/Dashboard/presentation/widgets/bar_chart_sample.dart';
import 'package:water/widgets/store_name_container.dart';
import 'package:water/widgets/value_pill_date_number_container.dart';
import 'package:water/widgets/visit_details_list_view_item.dart';

class ClientDetailsIndebtScreenBody extends StatelessWidget {
  const ClientDetailsIndebtScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // endDrawer: const Drawer(),
        body: BlocBuilder<InvoiceHistoryBloc, AppState>(
          bloc: invoiceHistoryBloc,
          builder: (context, state) {
            if (state is Loading) {
              return const LoadingPlaceHolder(
                shimmerType: ShimmerType.list,
                cellShimmerHeight: 50,
                shimmerCount: 10,
              );
            }
            else if (state is GetHistoryInvoiceDone) {
              if(state.invoiceResult != null ){

                return  SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.012,
                          ),
                           Text(
                            "debt_file".tr(),
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.008,
                      ),
                      const StoreNameContainer(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.008,
                      ),

                     Padding(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child:  BarChartSample(
                            title: "invoice_history".tr(),
                            statistics: state.invoiceResult!.statistics,
                          )
                      ),


                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.008,
                      ),
                      const ValuePillDateNumberContainer(),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.014,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.invoiceResult!.invoices!.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: VisitDetailsListViewItem(
                                number:  state.invoiceResult!.invoices![index].type! == "payment" ?
                                          state.invoiceResult!.invoices![index].paymentNumber!.toString()
                                          : state.invoiceResult!.invoices![index].invoiceNumber!.toString(),
                                date:  state.invoiceResult!.invoices![index].type! == "payment" ?
                                          state.invoiceResult!.invoices![index].paymentDate!.toString()
                                         : state.invoiceResult!.invoices![index].invoiceDate!.toString(),
                                pillType: state.invoiceResult!.invoices![index].type!,
                                productNumber: state.invoiceResult!.invoices![index].type! == "payment" ? ''
                                             :' ${state.invoiceResult!.invoices![index].itemsCount}  ${"product".tr()} ',
                                productValue:  state.invoiceResult!.invoices![index].type! == "payment" ?
                                                 '${state.invoiceResult!.invoices![index].paymentAmount}  ${"sar".tr()} '
                                                :'${state.invoiceResult!.invoices![index].amountTotal}  ${"sar".tr()} ',
                              ),
                            );
                          }),
                    ],
                  ),
                );
              }
              else{
                return Center(
                  child: Text("no_invoices".tr()),
                );
              }

            } else if (state is GetHistoryInvoiceErrorLoading) {
              return Center(
                child: Text("${state.message}"),
              );
            } else {
              return Container();
            }

          },
        )
       ,
      ),
    );
  }
}
