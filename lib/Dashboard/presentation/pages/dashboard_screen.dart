
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';
import 'package:water/Dashboard/data/models/dashboard_model.dart';
import 'package:water/Dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:water/Dashboard/presentation/widgets/bar_chart_sample.dart';
import 'package:water/Dashboard/presentation/widgets/linear_progress_indicator_widget.dart';
import 'package:water/widgets/transaction_details_container.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/xPrinter/presentation/pages/xPrinter_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: _Page(),
        screenButtons: []
    );
  }
}

class _Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<_Page> {


  @override
  void initState() {
    super.initState();
  dashboardBloc.add(GetDashboardEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
         textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child:  BlocBuilder<DashboardBloc, AppState>(
            bloc: dashboardBloc,
            builder: (context, state) {
              if (state is DashboardLoading) {
                return const LoadingPlaceHolder(
                  shimmerType: ShimmerType.list,
                  cellShimmerHeight: 50,
                  shimmerCount: 10,
                );
              }
              else if (state is GetDashboardDone) {
                DashboardModel dashboardModel = state.model as DashboardModel;
                if(dashboardModel.result != null ){

                  return Container(
                    color: kTransparentColor,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.015),
                            child: LinearProgressIndicatorWidget(
                              sales: dashboardModel.result!.sales,
                              target: dashboardModel.result!.target,
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kInactiveColor)
                              ),
                              height: MediaQuery.of(context).size.height * 0.11,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                    child: Text(
                                      'financial_performance'.tr(), // Localized Key
                                      style: TextStyle(
                                        color: const Color(0xff0f4a3c),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TransactionDetailsContainer(
                                        image: 'assets/images/BillList.png',
                                        color: Color(0xff0056C9),
                                        name: 'sales'.tr(), // Localized Key
                                        price: '${dashboardModel.result!.sales ?? 0}  ${"sar".tr()} ',
                                        hasBorder: false,
                                      ),
                                      Container(height: 25, width: 1.5, color: kInactiveColor,),
                                      TransactionDetailsContainer(
                                        image: 'assets/images/Union.png',
                                        color: Color(0xFFAC6521),
                                        name: 'returns'.tr(), // Localized Key
                                        price: '${dashboardModel.result!.returns ?? 0}  ${"sar".tr()} ',
                                        hasBorder: false,
                                      ),
                                      Container(height: 25, width: 1.5, color: kInactiveColor,),
                                      TransactionDetailsContainer(
                                        image: 'assets/images/moneyBaggg.png',
                                        color: Color(0xff1D6E4F),
                                        name: 'collections'.tr(), // Localized Key
                                        price: '${dashboardModel.result!.collection ?? 0}  ${"sar".tr()} ',
                                        hasBorder: false,
                                      ),
                                      Container(height: 25, width: 1.5, color: kInactiveColor,),
                                      TransactionDetailsContainer(
                                        image: 'assets/images/DangerTriangle.png',
                                        color: Color(0xffAF2A1A),
                                        name: 'debt'.tr(), // Localized Key
                                        price: '${dashboardModel.result!.amountDue ?? 0}  ${"sar".tr()} ',
                                        hasBorder: false,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            child: BarChartSample(
                              title: 'year_statistics_title'.tr(),
                              statistics: dashboardModel.result!.statistics ?? [],
                            )),
                      ],
                    ),
                  );
                }
                else{
                  return Center(
                    child: Text("noDataAvailableNow".tr()),
                  );
                }

              } else if (state is GetDashboardErrorLoading) {
                return Center(
                  child: Container(),
                );
              } else {
                return Container();
              }

            },
          ),


        ),
      ),
    );
  }

/*  List<Statistics> createDummyData() {
    return [
      Statistics(
          month: "January",
          sales: 4314.12,
          returns: 0.0,
          collection: 0.0),
      Statistics(
          month: "February",
          sales: 0.0,
          returns: 0.0,
          collection: 0.0),
      Statistics(
          month: "March",
          sales: 3200.0,
          returns: 100.0,
          collection: 3100.0),
      Statistics(
          month: "April",
          sales: 6500.0,
          returns: 200.0,
          collection: 6200.0),
      Statistics(
          month: "May",
          sales: 9800.0,
          returns: 500.0,
          collection: 9500.0),
    ];
  }*/
}
