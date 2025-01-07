import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Returns/data/models/returns_invoice_model.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/products_and_prices_invoices_details_screen.dart';

import './water_item_previous_invoices.dart';
import 'package:flutter/material.dart';

class SearchTextFieldInvoicesDetailsScreen extends StatelessWidget{
   SearchTextFieldInvoicesDetailsScreen({super.key,required this.invoice});
  final Invoice? invoice;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back),
                  ),
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.019,
              ),
                 Column(
                   children: [
                     Text(
                       ' ${"invioce_number".tr()}',
                       style: TextStyle(
                           fontSize: 23,
                           fontWeight: FontWeight.w500
                       ),
                     ),
                     Text(
                       ' ${invoice?.invoiceNumber}',
                       style: TextStyle(
                           fontSize: 23,
                           fontWeight: FontWeight.w500
                       ),
                     ),
                   ],
                 )
              ],
            ),
            Spacer(),
            const ProductsAndPricesInvoicesDetailsScreen()
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.019,
          ),
           WaterItemPreviousInvoices(
                        saleName: '${"sales".tr()} ${invoice?.amountTotal} ر.س',
                        pill: '${"invioce_number".tr()} ${invoice?.invoiceNumber}',
                        date: ' ${"issued_on".tr()} ${invoice?.invoiceDate}',
                        icon: 'assets/images/marketImage.png',
                        color: Color(0xff0056C9),
                        textIcon: '${invoice?.itemsCount}  ${"product".tr()}',
                      ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
/*        Container(
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait ?
           MediaQuery.of(context).size.height * 0.033
           : MediaQuery.of(context).size.height * 0.054,
          decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5),
            child: TextField(
              cursorColor: Color.fromARGB(255, 66, 64, 64),
              decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                prefixIcon: Image.asset(
                  'assets/images/search.png',
                  color: Colors.black,
                  ),
                  
                hintText: "search_for_product".tr(),
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 146, 155, 171),
                )
              ),
            ),
          )
        ),
    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),*/
      ],
    );
  }
}