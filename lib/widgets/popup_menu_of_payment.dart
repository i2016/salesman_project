
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class PopupMenuOfPayment extends StatelessWidget {
  final Function(String) onSelected;

  const PopupMenuOfPayment({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: const Icon(Icons.keyboard_arrow_down_outlined),
      ),
      onSelected: (value) {
        // Invoke the callback when a value is selected
        onSelected(value as String);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
         PopupMenuItem(
          value: "cash",
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.attach_money, size: 40),
              ),
              Text(
                "Cash".tr(),
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
         PopupMenuItem(
          value: "bank",
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.account_balance, size: 40),
              ),
              Text(
                "Bank_Transfer".tr(),
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
