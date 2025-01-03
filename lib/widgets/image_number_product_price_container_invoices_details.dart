import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ImageNumberProductPriceContainerInvoicesDetails extends StatelessWidget {
  const ImageNumberProductPriceContainerInvoicesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait ?
           MediaQuery.of(context).size.height * 0.033
           : MediaQuery.of(context).size.height * 0.054,
          decoration: const BoxDecoration(
              color: Color(0xffDCDFE3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9),
                topRight: Radius.circular(9),
              )),
          child:  Padding(
            padding: EdgeInsets.only(right: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "image".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "number".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    "product".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "unit".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "price".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
