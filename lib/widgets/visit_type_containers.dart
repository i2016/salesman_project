import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/custom_dropdown.dart';

class VisitTypeContainers extends StatelessWidget {
  const VisitTypeContainers(
      {super.key,
      required this.textFirstContainer,
      required this.textSecondContainer,
      required this.textThirdContainer});

  final String textFirstContainer;
  final String textSecondContainer;
  final String textThirdContainer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
            flex: 3,
            child: Text(
              "filter_by".tr(),
              style: TextStyle(
                  color: Color(0xff758195),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )),
        Expanded(
          flex: 3,
          child: CustomDropdown(
        title: textFirstContainer,
        height: MediaQuery.of(context).orientation == Orientation.portrait
    ? MediaQuery.of(context).size.height * 0.04
        : MediaQuery.of(context).size.height * 0.064,
        width: MediaQuery.of(context).size.width * 0.07,
        )

        ),
       SizedBox(
          width: MediaQuery.of(context).size.width * 0.025,
        ),
        Expanded(
          flex: 3,
          child:   CustomDropdown(
            title: textSecondContainer,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.04
                : MediaQuery.of(context).size.height * 0.064,
            width: MediaQuery.of(context).size.width * 0.07,
          )

        ),
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.025,
        ),
        Expanded(
          flex: 3,
          child: CustomDropdown(
            title: textThirdContainer,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.04
                : MediaQuery.of(context).size.height * 0.064,
            width: MediaQuery.of(context).size.width * 0.07,
          )
        ),
      ],
    );
  }
}
