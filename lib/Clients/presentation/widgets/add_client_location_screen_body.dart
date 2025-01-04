import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Clients/presentation/widgets/add_merchant_text_field.dart';
import 'package:water/widgets/location_container_widget.dart';

class AddClientLocationScreenBody extends StatelessWidget {
  AddClientLocationScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        endDrawer: const Drawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
               "add_address_location".tr(),
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).orientation ==
                  Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.466
                  : MediaQuery.of(context).size.height * 0.816,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding:
                const EdgeInsets.only(left: 11, right: 11, top: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "city".tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height:
                      MediaQuery.of(context).size.height * 0.003,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01,
                        right: MediaQuery.of(context).size.width * 0.01,
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.044
                          : MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 215, 212, 212),
                        ),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 9),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                               "choose_city".tr(),
                              style: TextStyle(
                                color: Color(0xff758195),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                ))
                          ],
                        ),
                      ),
                    ),
                     AddMerchantTextField(
                        hintTextField:  "enter_neighborhood".tr(),
                        nameTextField: "neighborhood".tr(),
                        input: TextInputType.name),
                     AddMerchantTextField(
                        hintTextField: "enter_postal_code".tr(),
                        nameTextField:  "postal_code".tr(),
                        input: TextInputType.phone),
                     AddMerchantTextField(
                        hintTextField: "enter_street".tr(),
                        nameTextField: "street".tr(),
                        input: TextInputType.emailAddress),
                     AddMerchantTextField(
                        hintTextField: "enter_property_number".tr(),
                        nameTextField: "property_number".tr(),
                        input: TextInputType.emailAddress),
                     Text(
                       "select_location".tr(),
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height:
                      MediaQuery.of(context).size.height * 0.005,
                    ),
                    const LocationContainer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
