import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/navigate_basic_container.dart';
import 'package:water/widgets/store_name_container.dart';
import 'package:water/widgets/visit_type_containers.dart';
import 'package:water/widgets/visits_history_screen_container_item.dart';

class ClientDetailsVisitsHistoryScreenBody extends StatelessWidget {
  ClientDetailsVisitsHistoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        "visit_history".tr(),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    const StoreNameContainer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                     VisitTypeContainers(
                      textFirstContainer: "visit_type".tr(),
                      textSecondContainer:  "from".tr() ,
                      textThirdContainer: "to".tr(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
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
                          date: '2024 / 5 / 15',
                          collect: '30,000',
                          complete: '30,000',
                          visit: "in_todays_visits".tr(),
                          returned: '30,000',
                          store: "store".tr(),
                          icon: 'assets/images/trueeStyle.png',
                          iconColor: Color(0xff0056C9),
                          iconProductType: 'assets/images/datee.png',
                          iconStoreName: 'assets/images/smallShop.png',
                          iconCompleted: 'assets/images/trueInSquare.png',
                          iconReturned: 'assets/images/RestartCircle.png',
                          iconCollected: 'assets/images/MoneyBag.png',
                          collectedColor: Color(0xff1D6E4F),
                        );
                      },
                    ),
                  ],
                ),
              ),
    );
  }
}
