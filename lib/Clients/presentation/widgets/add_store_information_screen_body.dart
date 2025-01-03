import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Clients/presentation/widgets/add_merchant_text_field.dart';
import 'package:water/widgets/take_photo_widget.dart';

class AddStoreInformationScreenBody extends StatelessWidget {
  AddStoreInformationScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
             "add_merchant_information".tr(),
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
                  ? MediaQuery.of(context).size.height * 0.43
                  : MediaQuery.of(context).size.height * 0.705,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14)),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     AddMerchantTextField(
                        hintTextField: "enter_store_name".tr(),
                        nameTextField: "store_name".tr(),
                        input: TextInputType.name),
                     AddMerchantTextField(
                        hintTextField: "enter_tax_number".tr(),
                        nameTextField: "tax_number".tr(),
                        input: TextInputType.phone),
                     AddMerchantTextField(
                        hintTextField: "enter_register_number".tr(),
                        nameTextField: "register_number".tr(),
                        input: TextInputType.emailAddress),
                     AddMerchantTextField(
                        hintTextField: "enter_official_website".tr(),
                        nameTextField: "official_website".tr(),
                        input: TextInputType.emailAddress),

                     Text(
                     "add_documents".tr(),
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    TakePhoto(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                     Text(
                      "make_sure_to_add_documents".tr(),
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    Row(
                      children: [
                        const Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005,
                        ),
                         Text(
                         "tax_register".tr(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005,
                        ),
                         Text(
                         "company_authentication".tr(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
