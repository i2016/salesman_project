import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/button.dart';
import 'package:water/widgets/google_map_container.dart';
import 'package:water/widgets/market_information_container.dart';
import 'package:water/widgets/navigate_basic_container.dart';
import 'package:water/widgets/trader_file_container.dart';

class ClientDetailsPendingScreenBody extends StatelessWidget {
  const ClientDetailsPendingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        // drawer: const Drawer(),
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
                              onTap: () {},
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
                                color: Colors.white,
                                iconImage: 'assets/images/Route.png',
                                buttonName: "directions".tr(),
                                textColor: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.011,
                            ),
                            InkWell(
                              onTap: () {},
                              child:  Button(
                                color: Colors.white,
                                iconImage: 'assets/images/phonee.png',
                                buttonName: "call_merchant".tr(),
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
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
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
                      textSmallContainer: "under_review".tr(),
                      iconSmallContainer:  'assets/images/VerifiedCheck.png',
                      color: Color(0xffAC6521),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.014,
                    ),
                     GoogleMapContainer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.014,
                    ),
                     MarketInformationContainer(container: false),
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
