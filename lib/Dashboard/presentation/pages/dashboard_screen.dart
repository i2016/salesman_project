import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Dashboard/presentation/widgets/bar_chart_sample.dart';
import 'package:water/Dashboard/presentation/widgets/linear_progress_indicator_widget.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
import 'package:water/widgets/transaction_details_container.dart';
import 'package:water/zebra/presentation/pages/home_page.dart';
import 'package:water/zebra/presentation/pages/zebra_printer_screen.dart';

class DashboardScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: _Page(),
      screenButtons: []
    );
  }

}

class _Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageState();
  }
}

class _PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Container(
                color: kTransparentColor,
                child: Column(
                  children: [
                   Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.015),
                   child:  LinearProgressIndicatorWidget()
                     /*InkWell(
                       onTap: (){
                         String jsonResponse = '''{
  "jsonrpc": "2.0",
  "id": null,
  "result": {
    "status_code": 200,
    "is_error": false,
    "message": "done",
    "result": {
      "order_id": 225170,
      "invoice_id": 12747518,
      "invoice_pdf": "https://yanabie-demo-16818111.dev.odoo.com/api/salesman/print_invoice_id/12747518",
      "invoice_data": {
        "company": {
          "name": "شركة ينابيع ينبع التجارية شركة شخص واحد",
          "vat": "311842083500003"
        },
        "items": [
          {
            "product_id": 930,
            "product_name": "55GX20  تسالي فلفل GR|TAS CHL 55GX20X1 GREND",
            "product_code": "360020742",
            "quantity": 1.0,
            "product_uom_id": 49,
            "product_uom_name": "Karton",
            "price_unit": 50.0,
            "tax": "15%",
            "discount": 0.0,
            "discount_amount": 0.0,
            "price_subtotal": 50.0,
            "invoice_line_id": 32556209,
            "description": ""
          },
          {
            "product_id": 935,
            "product_name": "55GX20 تسالي كمون وليمون GR|TAS CMN LMN 55GX20X1 GREND",
            "product_code": "360020749",
            "quantity": 1.0,
            "product_uom_id": 49,
            "product_uom_name": "Karton",
            "price_unit": 100.0,
            "tax": "15%",
            "discount": 0.0,
            "discount_amount": 0.0,
            "price_subtotal": 100.0,
            "invoice_line_id": 32556210,
            "description": ""
          },
          {
            "product_id": 940,
            "product_name": "55GX20 تسالي كاتشاب GR|TAS KET 55GX20X1 GREND",
            "product_code": "360020756",
            "quantity": 1.0,
            "product_uom_id": 49,
            "product_uom_name": "Karton",
            "price_unit": 150.0,
            "tax": "15%",
            "discount": 0.0,
            "discount_amount": 0.0,
            "price_subtotal": 150.0,
            "invoice_line_id": 32556211,
            "description": ""
          }
        ],
        "totals": {
          "quantity": 3.0,
          "price": 300.0,
          "vat": 45.0,
          "discount": 0.0,
          "grand_total": 345.0
        }
      }
    }
  }
}''';

                         CreateOrderResponseModel createOrderResponseModel
                           = CreateOrderResponseModel.fromJson(jsonDecode(jsonResponse));

                          Receipt receipt = Receipt();
                        receipt.sample(invoiceData: createOrderResponseModel.result!.invoiceData);

                       },
                       child: LinearProgressIndicatorWidget())*/
                   ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Container(
                     decoration: BoxDecoration(
                       color: kWhiteColor,
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(color: kInactiveColor)
                     ),
                      height: MediaQuery.of(context).size.height * 0.11,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          child: Text(
                            'احصائيات شهر مارس',
                            style: TextStyle(
                              color: const Color(0xff0f4a3c),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TransactionDetailsContainer(
                                image: 'assets/images/BillList.png',
                                color: Color(0xff0056C9),
                                name: 'مبيعات',
                                price: '25,000 ر.س',
                                hasBorder: false,
                              ),
                              Container(height: 25,width: 1.5,color: kInactiveColor,),
                              TransactionDetailsContainer(
                                image: 'assets/images/Union.png',
                                color: Color(0xFFAC6521),
                                name: 'مرتجعات',
                                price: '25,000 ر.س',
                                hasBorder: false,

                              ),
                              Container(height: 25,width: 1.5,color: kInactiveColor,),

                              TransactionDetailsContainer(
                                image: 'assets/images/moneyBaggg.png',
                                color: Color(0xff1D6E4F),
                                name: 'تحصيل',
                                price: '25,000 ر.س',
                                hasBorder: false,

                              ),
                              Container(height: 25,width: 1.5,color: kInactiveColor,),

                              TransactionDetailsContainer(
                                image: 'assets/images/DangerTriangle.png',
                                color: Color(0xffAF2A1A),
                                name: 'مديونية',
                                price: '25,000 ر.س',
                                hasBorder: false,

                              ),
                            ],
                          )
                        ],
                      ),
                    )),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child:  BarChartSample(
              title: 'احصائيات شهرية',
            ))
                  ],
                ),
              )),
        ));
  }
}
