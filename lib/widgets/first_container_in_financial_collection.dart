import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class FirstContainerInFinancialCollection extends StatelessWidget{
  final String total_amount;
  const FirstContainerInFinancialCollection({super.key,required this.total_amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).orientation == Orientation.portrait ?
             MediaQuery.of(context).size.height * 0.046
             : MediaQuery.of(context).size.height * 0.076,
            decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xffE34935),
            width: 1,
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child:  Center(
          child: Text(
            ' ${"invoice_value".tr()}  ${total_amount} ${"sar".tr()} ',
            style: TextStyle(
              color: Color(0xffAF2A1A),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
                            ),
          ),
        ),
      ],
    );
  }
}