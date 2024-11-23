import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Clients/presentation/bloc/invoice_history_bloc.dart';
import 'package:water/Visits/data/models/visits_history_model.dart';
import 'package:water/Visits/presentation/bloc/visits/visits_bloc.dart';
import 'package:water/Visits/presentation/pages/History/visits_history_screen.dart';
import 'package:water/index.dart';
import 'package:water/widgets/google_map_container.dart';
import 'package:water/widgets/market_information_container.dart';
import 'package:water/widgets/public_information_container.dart';
import 'package:water/widgets/transaction_details_container.dart';
import 'package:water/widgets/value_pill_date_number_container.dart';
import 'package:water/widgets/visit_details_list_view_item.dart';
import 'package:water/widgets/visit_details_market_information_container.dart';

class VisitHistoryDetailsScreenBody extends StatefulWidget {
  VisitHistory? visitHistory;
  VisitHistoryDetailsScreenBody({super.key,this.visitHistory});

  @override
  State<VisitHistoryDetailsScreenBody> createState() => _VisitHistoryDetailsScreenBodyState();
}

class _VisitHistoryDetailsScreenBodyState extends State<VisitHistoryDetailsScreenBody> {

  @override
  void initState() {
    super.initState();
    invoiceHistoryBloc.add(GetHistoryInvoiceEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // endDrawer: const Drawer(),
        body:  BlocBuilder<VisitsBloc, AppState>(
          bloc: visitsBloc,
          builder: (context, state) {
            if (state is Loading) {
              return const LoadingPlaceHolder(
                shimmerType: ShimmerType.list,
                cellShimmerHeight: 50,
                shimmerCount: 10,
              );
            }
            else if (state is GeTodayVisitDetailsDone) {
              if(state.visitDetails != null || state.visitDetails!.isNotEmpty){
                Shared.marketLatitude = state.visitDetails![0].lat =="" ? 0.0 : double.parse(state.visitDetails![0].lat);
                Shared.marketLongtitude = state.visitDetails![0].long  =="" ? 0.0 : double.parse(state.visitDetails![0].long);
                Shared.marketPhone = state.visitDetails![0].customerNumber;
                return    SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                customAnimatedPushNavigation(context, VisitsHistoryScreen());
                                },
                              child: Icon(Icons.arrow_back)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          const Text(
                            'تفاصيل الزيارة',
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
                       PublicInformationContainer(
                        name:  state.visitDetails![0].customerName ??'عبدالرحمن محمد علي',
                        phone: state.visitDetails![0].customerNumber ??'+966 4644 4646',
                        date: widget.visitHistory!.visitDate ??'23 / 5 / 2024',
                        time: '5:30 مساءً',
                      ),
                       Padding(
                        padding: EdgeInsets.symmetric(vertical: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TransactionDetailsContainer(
                              image: 'assets/images/BillList.png',
                              color: Color(0xff0056C9),
                              name: 'مبيعات',
                              price: '${double.parse(state.visitDetails![0].totalSales.toString()).toStringAsFixed(2)}  ر.س ',
                            ),
                            TransactionDetailsContainer(
                              image: 'assets/images/Union.png',
                              color: Color(0xFFAC6521),
                              name: 'مرتجعات',
                              price: '${double.parse(state.visitDetails![0].totalRefund.toString()).toStringAsFixed(2)}  ر.س ',
                            ),
                            TransactionDetailsContainer(
                              image: 'assets/images/moneyBaggg.png',
                              color: Color(0xff1D6E4F),
                              name: 'تحصيل',
                              price: '${double.parse(state.visitDetails![0].totalPayment.toString()).toStringAsFixed(2)}  ر.س ',
                            ),
                            TransactionDetailsContainer(
                              image: 'assets/images/DangerTriangle.png',
                              color: Color(0xffAF2A1A),
                              name: 'مديونية',
                              price: '${double.parse(state.visitDetails![0].totalAmountDue.toString()).toStringAsFixed(2)}  ر.س ',
                            ),
                          ],
                        ),
                      ),
                      const ValuePillDateNumberContainer(),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.014,
                      ),

                      BlocBuilder<InvoiceHistoryBloc, AppState>(
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

                              return  Container(
                                height: Shared.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
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
                                              :' ${state.invoiceResult!.invoices![index].itemsCount}  منتج ',
                                          productValue:  state.invoiceResult!.invoices![index].type! == "payment" ?
                                          '${state.invoiceResult!.invoices![index].paymentAmount}  ر.س '
                                              :'${state.invoiceResult!.invoices![index].amountTotal}  ر.س ',
                                        ),
                                      );
                                    })
                              );
                            }
                            else{
                              return Center(
                                child: Text("لا توجد فواتير حاليا"),
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
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.014,
                      ),
                      GoogleMapContainer(
                        address: state.visitDetails![0].customerAddress!,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.014,
                      ),
              //        const VisitDetailsMarketInformationContainer(),
                      MarketInformationContainer(
                        visitDetails: state.visitDetails![0],
                      ),
                    ],
                  ),
                );
              }
              else{
                return Center(
                  child: Text("لا توجد يانات حاليا"),
                );
              }

            } else if (state is GetTodayVisitDetailsErrorLoading) {
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
