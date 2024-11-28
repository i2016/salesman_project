import 'package:flutter/material.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';

class DeservedInvoicesItem extends StatelessWidget {
  final Invoice invoice;
  const DeservedInvoicesItem({super.key,required this.invoice});

  @override
  Widget build(BuildContext context) {
    print("invoice.amountDue : ${invoice.amountDue}");
    print("invoice.amountTotal : ${invoice.amountTotal}");
    print("ss : ${(invoice.amountDue / invoice.amountTotal)  * 100}");
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
             invoice == null ?   'فاتورة 123414'
                : invoice.invoiceNumber,
                style: TextStyle(
                    color: Color(0xff25292E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            //  Expanded(
            //   flex: 1,
            //   child:Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            // /*      Container(
            //           width: 20,
            //           height: 20,
            //           child: CircularProgressIndicator(
            //             value: 20,
            //             backgroundColor: kGreenColor,
            //             color: kGreenColor,
            //           ) ),*/
            //     Container(
            //     width: 20,
            //     height: 20,
            //     child:  ShaderMask(
            //         shaderCallback: (rect) {
            //           return RadialGradient(
            //             colors: [Colors.green, Colors.greenAccent],
            //             radius: 0.5,
            //             tileMode: TileMode.mirror,
            //           ).createShader(rect);
            //         },
            //         child: CircularProgressIndicator(
            //           strokeWidth:3.0,
            //           value: 20,
            //           valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent), // No need for color here
            //           backgroundColor: Colors.grey,
            //         ),
            //     ) ),
            //    Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            //    child:     Text(
            //        invoice == null ? '% 30' :    ' % ${(invoice.amountDue / invoice.amountTotal)  * 100}',
            //      style: TextStyle(
            //          color: Color(0xffAC6521),
            //          fontSize: 18,
            //          fontWeight: FontWeight.w300),
            //    ),),
            //     ],
            //   )
            // ),
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
                     invoice == null ? '20 يوم':  '${ DateTime.now().difference(DateTime.parse(invoice.invoiceDate)).inDays}  يوم  ',
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
                     invoice == null ? '200 ر.س ':    '${invoice.amountTotal} ر.س ',
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
