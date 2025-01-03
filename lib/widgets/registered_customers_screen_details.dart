import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Clients/presentation/pages/client_add_requests_screen.dart';
import 'package:water/widgets/button.dart';
import 'package:water/widgets/navigate_basic_container.dart';
import 'package:water/widgets/registered_customers_screen_container_item.dart';

class RegisteredCustomersScreenDetails extends StatelessWidget {
  RegisteredCustomersScreenDetails({super.key});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        endDrawer: const Drawer(),
        body: Padding(
          padding: const EdgeInsets.only(right: 18, left: 18, top: 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.24,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.041
                          : MediaQuery.of(context).size.height * 0.063,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){},
                              child: const ImageIcon(AssetImage(
                                  'assets/images/Icon-Wrappppper.png')),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                             Opacity(
                              opacity: 0.8,
                              child: Text(
                                "hide_list".tr(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    NavigateBasicContainer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.24,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.114
                          : MediaQuery.of(context).size.height * 0.182,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child:  Button(
                                color: Colors.black,
                                iconImage: 'assets/images/VectorAdddd.png',
                                buttonName: "Add Client".tr(),
                                textColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.011,
                            ),
                            InkWell(
                              onTap: () {
                                customAnimatedPushNavigation(context, ClientAddRequestsScreen());
                              },
                              child:  Button(
                                color: Colors.white,
                                iconImage: 'assets/images/addWithoutBorder.png',
                                buttonName: "add_requests".tr(),
                                textColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Registered Clients".tr(),
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
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
                          crossAxisSpacing:
                              MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 16
                                  : 11,
                          childAspectRatio:
                              MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 4.3 / 2
                                  : 5.2 / 2),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return  RegisteredCustomersScreenContainerItem(
                          storeName: "store_name".tr(),
                          sales: '${"Monthly_sales".tr()}30,000 ' ,
                          distance: "Far_away".tr() + "232" + "km".tr(),
                          money: '15,000 ${"debt".tr()}',

                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
