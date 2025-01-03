import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ImageNumberProductPriceContainerInventoryScreen extends StatelessWidget{
  const ImageNumberProductPriceContainerInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.033,
          decoration: const BoxDecoration(
          color: Color(0xffDCDFE3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(9),
              topRight: Radius.circular(9),
            )
          ),
          child:  Padding(
            padding: EdgeInsets.only(right: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "image".tr(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  ),
                  Expanded(
                  flex: 1,
                  child: Text(
                    "number".tr(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  ),
                  Expanded(
                  flex: 6,
                  child: Text(
                    "product".tr(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  ),
                  Expanded(
                  flex: 1,
                  child: Text(
                    "price".tr(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),
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