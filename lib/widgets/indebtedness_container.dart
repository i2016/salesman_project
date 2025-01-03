import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Clients/presentation/pages/client_details_indebt_screen.dart';
import 'package:water/Clients/presentation/pages/client_details_visits_history_screen.dart';
import 'package:water/widgets/transection_row_in_indebtedness_container.dart';

class IndebtednessContainer extends StatelessWidget {
  const IndebtednessContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.214
          : MediaQuery.of(context).size.height * 0.299,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                     Text(
                       "indebtednessFile".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.006,
                    ),
                    Container(
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.17
                          : MediaQuery.of(context).size.width * 0.095,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.019
                          : MediaQuery.of(context).size.height * 0.032,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 244),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/DangerTriangle.png',
                              color: const Color(0xffDD7208),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.004,
                            ),
                             Text(
                               "highDebt".tr(),
                              style: TextStyle(
                                  color: Color(0xFFAC6521),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/moneyBaggg.png',
                  color: const Color(0xffDCDFE3),
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.03
                          : MediaQuery.of(context).size.height * 0.044,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Image.asset('assets/images/threeDash.png'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.033,
                      ),
                      Image.asset(
                        'assets/images/BillList.png',
                        color: const Color(0xff111111),
                        width: MediaQuery.of(context).size.height * 0.014,
                        height: MediaQuery.of(context).size.height * 0.0144,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.006,
                      ),
                       Text(
                         "invoiceType".tr(),
                        style: TextStyle(
                            color: Color(0xff111111),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/costThis.png',
                        width: MediaQuery.of(context).size.height * 0.014,
                        height: MediaQuery.of(context).size.height * 0.0144,
                        color: const Color(0xff111111),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.006,
                      ),
                       Text(
                         "amount".tr(),
                        style: TextStyle(
                            color: Color(0xff111111),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/CalendarMark.png',
                        width: MediaQuery.of(context).size.height * 0.014,
                        height: MediaQuery.of(context).size.height * 0.0144,
                        color: const Color(0xff111111),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.006,
                      ),
                       Text(
                         "date".tr(),
                        style: TextStyle(
                            color: Color(0xff111111),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
             TransectionRowInIndebtednessContainer(
              image: 'assets/images/BillList.png',
              name: "Sales Order".tr(),
              color: Color(0xff0056C9),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
             TransectionRowInIndebtednessContainer(
              image: 'assets/images/RestartCircle.png',
              name: "Return".tr(),
              color: Color(0xFFAC6521),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            const TransectionRowInIndebtednessContainer(
              image: 'assets/images/BillList.png',
              name: 'أمر بيع',
              color: Color(0xff0056C9),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
             TransectionRowInIndebtednessContainer(
              image: 'assets/images/MoneyBag.png',
              name:  "collection".tr(),
              color: Color(0xff1D6E4F),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
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
                         Opacity(
                          opacity: 0.9,
                          child: Text(
                            "showIndebtednessFile".tr(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                         Opacity(
                          opacity: 0.9,
                          child: Text(
                            "showVisitHistory".tr(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
