import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/custom_dropdown.dart';

class DurationStatusContainers extends StatelessWidget {
  const DurationStatusContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
            flex: 2,
            child: Text(
              "filter_by".tr(),
              style: TextStyle(
                  color: Color(0xff758195),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )),
            Expanded(
            flex: 3,
            child:     CustomDropdown(
              title:  'الفترة',
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.04
                  : MediaQuery.of(context).size.height * 0.064,
              width: MediaQuery.of(context).size.width * 0.1,
            )

            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.025,
            ),
            Expanded(
            flex: 3,
            child:    CustomDropdown(
              title:    "status".tr(),
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.04
                  : MediaQuery.of(context).size.height * 0.064,
            )
            ),
      ],
    );
  }
}
