import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class RadioButtonForProduct extends StatefulWidget {
  const RadioButtonForProduct({super.key});

  @override
  State<RadioButtonForProduct> createState() => _RadioButtonForProductState();
}

class _RadioButtonForProductState extends State<RadioButtonForProduct> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
           "return_type".tr(),
          style: TextStyle(
              color: Color(0xff25292E),
              fontSize: 16,
              fontWeight: FontWeight.w500
              ),
        ),
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                }),
         Text(
           "bad_return".tr(),
          style: TextStyle(
              color: Color(0xff758195),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
          ]
          ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                }),
         Text(
          "good_return".tr(),
          style: TextStyle(
              color: Color(0xff758195),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
          ],
          ),
      ],
    );
  }
}
