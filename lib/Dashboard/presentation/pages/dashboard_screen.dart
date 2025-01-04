
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Dashboard/presentation/widgets/bar_chart_sample.dart';
import 'package:water/Dashboard/presentation/widgets/linear_progress_indicator_widget.dart';
import 'package:water/widgets/transaction_details_container.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Container(
            color: kTransparentColor,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.015),
                    child: LinearProgressIndicatorWidget()
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
                              'monthly_statistics'.tr(), // Localized Key
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
                                price: '25,000 ر.س',
                                hasBorder: false,
                              ),
                              Container(height: 25, width: 1.5, color: kInactiveColor,),
                              TransactionDetailsContainer(
                                image: 'assets/images/Union.png',
                                color: Color(0xFFAC6521),
                                name: 'returns'.tr(), // Localized Key
                                price: '25,000 ر.س',
                                hasBorder: false,
                              ),
                              Container(height: 25, width: 1.5, color: kInactiveColor,),
                              TransactionDetailsContainer(
                                image: 'assets/images/moneyBaggg.png',
                                color: Color(0xff1D6E4F),
                                name: 'collections'.tr(), // Localized Key
                                price: '25,000 ر.س',
                                hasBorder: false,
                              ),
                              Container(height: 25, width: 1.5, color: kInactiveColor,),
                              TransactionDetailsContainer(
                                image: 'assets/images/DangerTriangle.png',
                                color: Color(0xffAF2A1A),
                                name: 'debt'.tr(), // Localized Key
                                price: '25,000 ر.س',
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
                    title: 'monthly_statistics_title'.tr(), // Localized Key
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
