import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Clients/presentation/widgets/add_merchant_text_field.dart';

class AddMerchantInformationScreenBody extends StatelessWidget {
  AddMerchantInformationScreenBody({super.key});

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
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.241
                : MediaQuery.of(context).size.height * 0.182,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
              child: Column(
                children: [
                  AddMerchantTextField(
                    hintTextField: "enter_full_name".tr(),
                    nameTextField: "merchant_name".tr(),
                    input: TextInputType.name,
                    isRequired: true,
                    initialValue: Shared.addMerchantName,
                    onChange: (value) {
                      print(value);
                      Shared.addMerchantName = value ?? '';
                    },
                  ),
                  AddMerchantTextField(
                    hintTextField: "enter_saudi_number".tr(),
                    nameTextField: "phone_number".tr(),
                    input: TextInputType.phone,
                    initialValue: Shared.addMerchantPhone,
                    isRequired: true,
                    onChange: (value) {
                      print(value);
                      Shared.addMerchantPhone = value ?? '';
                    },
                  ),
                  AddMerchantTextField(
                    hintTextField: "enter_email".tr(),
                    nameTextField: "email".tr(),
                    isRequired: true,
                    initialValue: Shared.addMerchantEmail,
                    input: TextInputType.emailAddress,
                    onChange: (value) {
                      print(value);
                      Shared.addMerchantEmail = value ?? '';
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
