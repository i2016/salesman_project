import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Clients/presentation/widgets/add_merchant_text_field.dart';
import 'package:water/Clients/presentation/widgets/city_dropdown_widget.dart';
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CityDropdown(),

                     AddMerchantTextField(
                        hintTextField:  "enter_neighborhood".tr(),
                        nameTextField: "neighborhood".tr(),
                        input: TextInputType.name,
                       initialValue: Shared.addStoreLocationRegion,

                       onChange: (value) {
                         print(value);
                         Shared.addStoreLocationRegion = value ?? '';
                       },),
                     AddMerchantTextField(
                        hintTextField: "enter_postal_code".tr(),
                        nameTextField:  "postal_code".tr(),
                        input: TextInputType.phone,
                       initialValue: Shared.addStoreLocationPostCode,

                       onChange: (value) {
                         print(value);
                         Shared.addStoreLocationPostCode = value ?? '';
                       },),
                     AddMerchantTextField(
                        hintTextField: "enter_street".tr(),
                        nameTextField: "street".tr(),
                        input: TextInputType.emailAddress,
                       initialValue: Shared.addStoreLocationStreet,
                       isRequired: true,
                       onChange: (value) {
                         print(value);
                       },),
                     AddMerchantTextField(
                        hintTextField: "enter_property_number".tr(),
                        nameTextField: "property_number".tr(),
                        input: TextInputType.emailAddress,
                       initialValue: Shared.addStoreLocationBuildingNo,

                       onChange: (value) {
                         print(value);
                         Shared.addStoreLocationBuildingNo = value ?? '';
                       },),
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
