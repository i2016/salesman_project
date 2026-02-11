
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/responsive_utils.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';
import 'package:water/Dashboard/data/models/dashboard_model.dart';
import 'package:water/Dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:water/Dashboard/presentation/widgets/bar_chart_sample.dart';
import 'package:water/Dashboard/presentation/widgets/linear_progress_indicator_widget.dart';
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

        child: BlocBuilder<DashboardBloc, AppState>(
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
                if(dashboardModel.result != null  && dashboardModel.result != ""){

                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: LinearProgressIndicatorWidget(
                                sales: dashboardModel.result!.sales,
                                target: dashboardModel.result!.target,
                              )
                          ),

                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: kInactiveColor)
                                ),
                                padding: EdgeInsets.all(context.isMobile ? 12.w : 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'financial_performance'.tr(),
                                      style: TextStyle(
                                        color: const Color(0xff0f4a3c),
                                        fontSize: context.isMobile ? 16.sp : 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    context.isMobile
                                        ? _buildMobileStats(dashboardModel)
                                        : _buildTabletStats(dashboardModel),
                                  ],
                                ),
                              )
                          ),

                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                              child: BarChartSample(
                                title: 'year_statistics_title'.tr(),
                                statistics: dashboardModel.result!.statistics ?? [],
                              )),
                        ],
                      ),
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
      
    );
  }

  Widget _buildMobileStats(DashboardModel dashboardModel) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 8.w,
      mainAxisSpacing: 8.h,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard(
          'assets/images/BillList.png',
          Color(0xff0056C9),
          'sales'.tr(),
          '${double.parse(dashboardModel.result!.sales.toString()).toStringAsFixed(2)} ${"sar".tr()}',
        ),
        _buildStatCard(
          'assets/images/Union.png',
          Color(0xFFAC6521),
          'returns'.tr(),
          '${double.parse(dashboardModel.result!.returns.toString()).toStringAsFixed(2)} ${"sar".tr()}',
        ),
        _buildStatCard(
          'assets/images/moneyBaggg.png',
          Color(0xff1D6E4F),
          'collections'.tr(),
          '${double.parse(dashboardModel.result!.collection.toString()).toStringAsFixed(2)} ${"sar".tr()}',
        ),
        _buildStatCard(
          'assets/images/DangerTriangle.png',
          Color(0xffAF2A1A),
          'debt'.tr(),
          '${double.parse(dashboardModel.result!.amountDue.toString()).toStringAsFixed(2)} ${"sar".tr()}',
        ),
      ],
    );
  }

  Widget _buildTabletStats(DashboardModel dashboardModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildStatCard(
            'assets/images/BillList.png',
            Color(0xff0056C9),
            'sales'.tr(),
            '${double.parse(dashboardModel.result!.sales.toString()).toStringAsFixed(2)} ${"sar".tr()}',
          ),
        ),
        Container(height: 25.h, width: 1.5.w, color: kInactiveColor),
        Expanded(
          child: _buildStatCard(
            'assets/images/Union.png',
            Color(0xFFAC6521),
            'returns'.tr(),
            '${double.parse(dashboardModel.result!.returns.toString()).toStringAsFixed(2)} ${"sar".tr()}',
          ),
        ),
        Container(height: 25.h, width: 1.5.w, color: kInactiveColor),
        Expanded(
          child: _buildStatCard(
            'assets/images/moneyBaggg.png',
            Color(0xff1D6E4F),
            'collections'.tr(),
            '${double.parse(dashboardModel.result!.collection.toString()).toStringAsFixed(2)} ${"sar".tr()}',
          ),
        ),
        Container(height: 25.h, width: 1.5.w, color: kInactiveColor),
        Expanded(
          child: _buildStatCard(
            'assets/images/DangerTriangle.png',
            Color(0xffAF2A1A),
            'debt'.tr(),
            '${double.parse(dashboardModel.result!.amountDue.toString()).toStringAsFixed(2)} ${"sar".tr()}',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String image, Color color, String name, String price) {
    return Container(
      padding: EdgeInsets.all(8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 20.h, color: color),
          SizedBox(height: 4.h),
          Text(
            name,
            style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          Text(
            price,
            style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
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
