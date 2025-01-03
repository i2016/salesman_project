import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/custom_dropdown.dart';

class BillContainer extends StatelessWidget{
  const BillContainer({super.key, required this.containerName});

final String containerName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              "filter_by".tr(),
              style: TextStyle(
                color: Color(0xff758195),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            CustomDropdown(
              title: containerName,
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).orientation ==
                  Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.04
                  : MediaQuery.of(context).size.height * 0.06,
            )
          ],
        )
      ],
    );
  }
}