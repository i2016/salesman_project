import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/google_map_container.dart';
import 'package:water/widgets/indebtedness_container.dart';
import 'package:water/widgets/market_information_container.dart';
import 'package:water/widgets/trader_file_container.dart';
import 'package:water/widgets/transaction_details_container.dart';

class ClientDetailsScreenBody extends StatelessWidget {
  const ClientDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        // endDrawer: const Drawer(),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                     Text(
                      "merchant_details".tr(),
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
                  traderName: 'عبدالرحمن محمد علي',
                  phone: '+966 4644 4646',
                  textSmallContainer: "in_today_visits".tr(),
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
                        name: "sales".tr(),
                        price: '25,000 ${"sar".tr()}',
                      ),
                      TransactionDetailsContainer(
                        image: 'assets/images/Union.png',
                        color: Color(0xFFAC6521),
                        name: "returns".tr(),
                        price: '25,000 ${"sar".tr()}',
                      ),
                      TransactionDetailsContainer(
                        image: 'assets/images/moneyBaggg.png',
                        color: Color(0xff1D6E4F),
                        name: "collection".tr(),
                        price: '25,000 ${"sar".tr()}',
                      ),
                      TransactionDetailsContainer(
                        image: 'assets/images/DangerTriangle.png',
                        color: Color(0xffAF2A1A),
                        name: "debt".tr(),
                        price: '25,000 ${"sar".tr()}',
                      ),
                    ],
                  ),
                ),
                const IndebtednessContainer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.014,
                ),
                 GoogleMapContainer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.014,
                ),
                 MarketInformationContainer(),
              ],
            ),
          ),
        ),
    );
  }
}
