import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/returned_details_container.dart';
import 'package:water/widgets/review_product_water_item.dart';
import 'package:water/widgets/search_text_field.dart';

class OrderDetailsSaleScreenBody extends StatelessWidget{
  const OrderDetailsSaleScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        // endDrawer: const Drawer(),
        body: SingleChildScrollView(
          child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(Icons.arrow_back)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                             Text(
                            "order_details".tr(),
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                         ReturnedDetailsContainer(
                          iconReturned: 'assets/images/trueInSquare.png',
                          nameReturned: "return_order".tr(),
                          icon: 'assets/images/trueeStyle.png',
                          traderName:  "trader_name".tr(),
                          date: "date".tr(),
                          phone: '+966 4644 4646',
                          cost: '30,000 ${"sar".tr()}',
                          time: "time".tr(),
                          number: "number_of_products".tr(),
                          textSmallContainer: "approval_status".tr(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.012,
                        ),
                         SearchTextField(
                          hintTextField: "search_product".tr(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.018,
                        ),
                        const ImageNumberProductPriceContainer(),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child:  ReviewProductWaterItem(),
                              );
                            }),
                      ],
                    ),
        ),
                ),
    );
  }
}