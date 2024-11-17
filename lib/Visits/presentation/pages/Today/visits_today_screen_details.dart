import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Visits/presentation/bloc/today_visits_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/available_items_screen.dart';
import 'package:water/index.dart';
import 'package:water/widgets/google_map_container.dart';
import 'package:water/widgets/market_information_container.dart';
import 'package:water/widgets/trader_file_container.dart';
import 'package:water/widgets/transaction_details_container.dart';

import '../../../../Base/Shimmer/loading_shimmer.dart';


class VisitsTodayDetailsScreen extends StatelessWidget{
   VisitsTodayDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child:  _page(
        ),
        screenButtons: [
          AppButtonWidget(
            asset: 'assets/images/startVisit.png',
            text: 'بدأ الزيارة',
            onClick: (){
              customAnimatedPushNavigation(context, AvailableItemsScreen());
            },
          ),
          AppButtonWidget(
            asset: 'assets/images/Route.png',
            text: 'الاتجاهات',
            onClick: (){
              launchGoogleMaps(Shared.marketLatitude , Shared.marketLongtitude);
            },
            color: kWhiteColor,
          ),
          AppButtonWidget(
            asset: 'assets/images/phonee.png',
            text: 'الإتصال بالتاجر',
            onClick: (){
              launchUrlString("tel://${Shared.marketPhone}");
            },
            color: kWhiteColor,
          ),
        ]);
  }

  void launchGoogleMaps(double latitude, double longitude) async {
    final String googleMapsUrl = "https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude";
    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}

class _page extends StatefulWidget {
  final String? visitId;
  _page({super.key,this.visitId});

  @override
  State<_page> createState() => _pageState();
}

class _pageState extends State<_page> {

  @override
  void initState() {
    todayVisitsBloc.add(GetTodayVisitsDetailsEvent(
      visit_id: widget.visitId
    ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child:    BlocBuilder<TodayVisitsBloc, AppState>(
            bloc: todayVisitsBloc,
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: (){
                                customAnimatedPushNavigation(context, VisitsTodayScreen());
                              },
                              child: const Icon(Icons.arrow_back)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          const Text(
                            'تفاصيل التاجر',
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
                       TraderFileContainer(
                        traderName: state.visitDetails![0].customerName!,
                        phone: state.visitDetails![0].customerNumber!,
                        textSmallContainer: 'في زيارات اليوم',
                        iconSmallContainer:  'assets/images/VerifiedCheck.png',
                        color: Color(0xff0056C9),
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
                              price: '${double.parse(state.visitDetails![0].totalSales!.toString()).toStringAsFixed(2)}  ر.س ',
                            ),
                            TransactionDetailsContainer(
                              image: 'assets/images/Union.png',
                              color: Color(0xFFAC6521),
                              name: 'مرتجعات',
                              price: '${double.parse(state.visitDetails![0].totalRefund!.toString()).toStringAsFixed(2)}  ر.س ',
                            ),
                            TransactionDetailsContainer(
                              image: 'assets/images/moneyBaggg.png',
                              color: Color(0xff1D6E4F),
                              name: 'تحصيل',
                              price: '${double.parse(state.visitDetails![0].totalPayment!.toString()).toStringAsFixed(2)}  ر.س '
                            ),
                            TransactionDetailsContainer(
                              image: 'assets/images/DangerTriangle.png',
                              color: Color(0xffAF2A1A),
                              name: 'مديونية',
                              price:'${double.parse(state.visitDetails![0].totalAmountDue!.toString()).toStringAsFixed(2)}  ر.س '
                            ),
                          ],
                        ),
                      ),
                    //  const IndebtednessContainer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              customAnimatedPushNavigation(context, const ClientDetailsIndebtScreen());
                            },
                            child: Container(
                              width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                                  ? MediaQuery.of(context).size.height * 0.2
                                  : MediaQuery.of(context).size.height * 0.52,
                              height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                                  ? MediaQuery.of(context).size.height * 0.042
                                  : MediaQuery.of(context).size.height * 0.072,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.4,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/fileIndebeness.png',
                                    width: MediaQuery.of(context).size.width * 0.025,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.003,
                                  ),
                                  const Opacity(
                                    opacity: 0.9,
                                    child: Text(
                                      'اظهار ملف المديونية',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
/*
                          InkWell(
                            onTap: () {
                              customAnimatedPushNavigation(context, const ClientDetailsVisitsHistoryScreen());
                            },
                            child: Container(
                              width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                                  ? MediaQuery.of(context).size.height * 0.2
                                  : MediaQuery.of(context).size.height * 0.52,
                              height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                                  ? MediaQuery.of(context).size.height * 0.042
                                  : MediaQuery.of(context).size.height * 0.072,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.4,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/History3.png',
                                    width: MediaQuery.of(context).size.width * 0.025,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.003,
                                  ),
                                  const Opacity(
                                    opacity: 0.9,
                                    child: Text(
                                      'اظهار تاريخ الزيارات',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
*/
                        ],
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
                       MarketInformationContainer(
                        visitDetails: state.visitDetails![0],
                      ),
                    ],
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
      ),
    );
  }
}
