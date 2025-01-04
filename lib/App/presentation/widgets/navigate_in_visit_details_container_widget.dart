import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Visits/presentation/pages/History/visit_details_screen_collected.dart';
import 'package:water/Visits/presentation/pages/History/visit_history_details_screen.dart';
import 'package:water/Visits/presentation/pages/Today/available_items_screen.dart';
import 'package:water/Visits/presentation/pages/Today/previous_invoices_screen.dart';
import 'package:water/index.dart';
import 'package:water/App/presentation/widgets/trader_deal_container_item.dart';

class NavigateInVisitDetailsContainer extends StatefulWidget {
  NavigateInVisitDetailsContainer({super.key, this.userType = "B2C",});
  final String userType;

  @override
  State<NavigateInVisitDetailsContainer> createState() => _NavigateBasicContainerState();
}

class _NavigateBasicContainerState extends State<NavigateInVisitDetailsContainer> {
  int index = 0;
  List<ElementEntity> MainMenu =[];
  List<ElementEntity> subMenu =[];

  @override
  void initState() {
    MainMenu = [
      ElementEntity(title: "overview".tr(), image: 'assets/images/overView.png', screenIndex:  0),
      ElementEntity(title: "sales".tr(), image: 'assets/images/Shop.png', screenIndex:  1),
      ElementEntity(title: "returns".tr(), image: 'assets/images/RestartCircle.png', screenIndex:  2),
      ElementEntity(title:  "collection".tr(), image: 'assets/images/MoneyBag.png', screenIndex:  3),
    ];
    super.initState();
  }

  List<Widget> _mainMenuBuildScreens = [
    VisitHistoryDetailsScreen(),
    VisitDetailsScreenSales(),
    VisitDetailsScreenReturned(),
    VisitDetailsScreenCollected(),
  ];
  List<Widget> _subMenuBuildScreens = [
    AvailableItemsScreen(),
    PreviousInvoicesScreen(),
    PreviousInvoicesScreen(),
    FinancialCollectionScreen(),
    AttachPhotosScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   "visit_details".tr(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.014,
                  ),
                   ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: MainMenu.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.011),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              index = i;
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> _mainMenuBuildScreens[index]));
                            });

                          },
                          child: TraderDealContainerItem(
                            name: MainMenu[i].title,
                            image: MainMenu[i].image,
                            onClickStatus: MainMenu[i].screenIndex == index,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ElementEntity {
  final String title;
  final String image;
  final int screenIndex;

  ElementEntity({required this.title, required this.image, required this.screenIndex});
}


