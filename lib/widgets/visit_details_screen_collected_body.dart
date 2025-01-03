import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Visits/presentation/pages/History/visits_history_screen.dart';
import 'package:water/widgets/collected_button.dart';
import 'package:water/widgets/collected_list_view_item.dart';
import 'package:water/widgets/navigate_basic_container.dart';
import 'package:water/widgets/public_information_container.dart';
import 'package:water/widgets/invoices_container.dart';
import 'package:water/widgets/visit_details_container.dart';

class VisitDetailsScreenCollectedBody extends StatelessWidget {
  const VisitDetailsScreenCollectedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {Navigator.of(context).pop();},
                            child: Icon(Icons.arrow_back)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                         Text(
                       "visit_details".tr(),
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
                    const PublicInformationContainer(
                      name: 'عبدالرحمن محمد علي',
                      phone: '+966 4644 4646',
                      date: '23 / 5 / 2024',
                      time: '5:30 مساءً',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.12
                          : MediaQuery.of(context).size.height * 0.21,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                 "collected_invoices".tr(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.008,
                                ),
                                Image.asset(
                                  'assets/images/BillList.png',
                                  color: const Color(0xffDCDFE3),
                                  height: MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? MediaQuery.of(context).size.height *
                                          0.032
                                      : MediaQuery.of(context).size.height *
                                          0.058,
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.004,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InvoicesContainer(
                                  pillType: 'تحصيل 500 ر.س',
                                  pillNumber: 'فاتورة رقم 123414',
                                  date: 'اصدار بتاريخ 21 / 8 / 2024',
                                  productNote: 'شيك',
                                  color: Color(0xff1D6E4F),
                                  icon: 'assets/images/MoneyBag.png',
                                ),
                                InvoicesContainer(
                                  pillType: 'ارتجاع 500 ر.س',
                                  pillNumber: 'فاتورة رقم 123414',
                                  date: 'اصدار بتاريخ 21 / 8 / 2024',
                                  productNote: '50 منتج',
                                  color: Color(0xff1D6E4F),
                                  icon: 'assets/images/MoneyBag.png',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.15
                          : MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: CollectedListViewItem(),
                            );
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.014,
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CollectedButton(
                            color: Color(0xff1D6E4F),
                            description: '${"collected_amount".tr()}  25,000 ${"sar".tr()}',
                            borderColor: Color(0xff23A36D),
                          ),
                          CollectedButton(
                            color: Color(0xffAF2A1A),
                            description: '${"remaining_amount".tr()}  25,000 ${"sar".tr()}',
                            borderColor: Color(0xffE34935),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
