import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/duration_status_contianers.dart';
import 'package:water/widgets/search_text_field.dart';
import 'package:water/widgets/visits_history_screen_container_item.dart';

class ReturnOrdersScreenDetails extends StatelessWidget {
  ReturnOrdersScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:  TextDirection.rtl,
      child: Scaffold(
        body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "return_orders".tr(),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                     SearchTextField(hintTextField:   "search_invoice".tr()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    const DurationStatusContainers(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 2
                            : 3,
                        crossAxisSpacing: 16,
                        childAspectRatio: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 4.3 / 2
                            : 4.9 / 2,
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return  VisitsHistoryScreenContainerItem(
                          date: '${"return_order".tr()} 12313',
                          collect: "number_of_products".tr(),
                          complete: '30,000 ${"sar".tr()}',
                          visit: "approved".tr(),
                          returned: "time".tr(),
                          store: "store_name".tr(),
                          icon: 'assets/images/trueeStyle.png',
                          iconColor: Color(0xff1D6E4F),
                          iconProductType: 'assets/images/RestartCircle.png',
                          iconStoreName: 'assets/images/smallShop.png',
                          iconCompleted: 'assets/images/Banknote2.png',
                          iconReturned: 'assets/images/timeHistory.png',
                          iconCollected: 'assets/images/marketImage.png',
                          collectedColor: Colors.black,
                        );
                      },
                    ),
                  ],
                ),
      ),
    );
  }
}
