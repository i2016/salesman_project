import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/index.dart';
import 'package:water/widgets/search_text_field.dart';
import 'package:water/widgets/visit_type_containers.dart';
import 'package:water/widgets/visits_history_screen_container_item.dart';

class WorkOrdersScreenBody extends StatelessWidget {
  WorkOrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [
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
                       "work_orders".tr(),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                     SearchTextField(hintTextField: "search_invoice".tr()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                     VisitTypeContainers(
                      textFirstContainer: "period".tr(),
                      textSecondContainer: "status".tr(),
                      textThirdContainer: "order_type".tr(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                index % 2 == 0 ?    const OrderDetailsSaleScreen()
                            : const OrderDetailsReturnScreen()));
                          },
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: VisitsHistoryScreenContainerItem(
                              date: index % 2 == 0 ?  'امر بيع 2313' : 'امر مرتجع 2313',
                              collect: '50 منتج',
                              complete: '30,000 ${"sar".tr()}',
                              visit: "approval_status".tr(),
                              returned: '10,000 ${"sar".tr()}',
                              store: 'اسم المتجر',
                              icon: 'assets/images/trueeStyle.png',
                              iconColor: Color(0xff1D6E4F),
                              iconProductType: 'assets/images/trueInSquare.png',
                              iconStoreName: 'assets/images/smallShop.png',
                              iconCompleted: 'assets/images/Banknote2.png',
                              iconReturned: 'assets/images/timeHistory.png',
                              iconCollected: 'assets/images/marketImage.png',
                              collectedColor: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
    );
  }
}
