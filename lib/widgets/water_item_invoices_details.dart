import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Returns/data/models/invoices_details_model.dart';

class WaterItemInvoicesDetails extends StatelessWidget{
  WaterItemInvoicesDetails({super.key,  this.item,});

final Item? item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: double.infinity,
    /*          height: MediaQuery.of(context).orientation == Orientation.portrait ?
           MediaQuery.of(context).size.height * 0.060
           : MediaQuery.of(context).size.height * 0.075,*/
              decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset('assets/images/IMGggg.png')
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                     Expanded(
                    flex: 2,
                    child: Text(
                    double.parse( item!.quantity!.toString()).toInt().toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                     Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item?.category ?? '',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                         Text(
                          item!.productName!,
                        maxLines: 6,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ],
                    ),
                    ),
                     Expanded(
                    flex: 2,
                    child: Text(
                      '${item!.uom_name!.toString()} ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${item!.price!.toString()}  ${"sar".tr()} ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
}
}