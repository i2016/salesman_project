import 'package:flutter/material.dart';
import 'package:water/Returns/data/models/invoices_details_model.dart';

class WaterItemInvoicesDetails extends StatelessWidget{
  WaterItemInvoicesDetails({super.key,  this.item,});

final Items? item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: double.infinity,
              height: MediaQuery.of(context).orientation == Orientation.portrait ?
           MediaQuery.of(context).size.height * 0.049
           : MediaQuery.of(context).size.height * 0.066,
              decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/IMGggg.png')
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                     Expanded(
                    flex: 1,
                    child: Text(
                      item!.quantity!.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                     Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'الكاتجوري',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              '   .   ',
                              style: TextStyle(
                                color: Color(0xff25292E),
                                fontSize: 18,
                                fontWeight: FontWeight.w900
                              ),
                            ),
                              Text(
                              'مياه',
                              style: TextStyle(
                                color: Color(0xff25292E),
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                         Text(
                          item!.productName!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                    ),
                     Expanded(
                    flex: 1,
                    child: Text(
                      '${item!.productId!.toString()} ر.س',
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