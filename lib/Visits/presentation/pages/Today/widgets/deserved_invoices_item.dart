import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';

class DeservedInvoicesItem extends StatelessWidget {
  final Invoice invoice;
  const DeservedInvoicesItem({super.key,required this.invoice});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.014),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        width: double.infinity,
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * 0.048
            : MediaQuery.of(context).size.height * 0.076,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8)),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Expanded(
              flex: 2,
              child: Text(
             invoice == null ?   "invoice_default".tr()
                : invoice.invoiceNumber,
                style: TextStyle(
                    color: Color(0xff25292E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),

            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/period.png',
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.004,
                    ),
                   Text(
                     invoice == null ? "days_default".tr():  '${ DateTime.now().difference(
                         DateTime.parse(invoice.invoiceDate)).inDays}  ${"day_label".tr()}  ',
                style: TextStyle(
                    color: Color(0xffAC6521),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/VectorError.png',
                    height: MediaQuery.of(context).size.height * 0.013,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.004,
                    ),
                   Text(
                     invoice == null ? "currency_default".tr():    '${invoice.amountTotal} ${"sar".tr()} ',
                style: TextStyle(
                    color: Color(0xffAC6521),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
