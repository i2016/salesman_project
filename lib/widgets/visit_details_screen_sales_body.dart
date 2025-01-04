import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/bill_container.dart';
import 'package:water/widgets/public_information_container.dart';
import 'package:water/widgets/review_product_water_item.dart';
import 'package:water/widgets/invoices_container.dart';
import 'package:water/widgets/search_text_field.dart';

class VisitDetailsScreenSalesBody extends StatelessWidget {
  const VisitDetailsScreenSalesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {Navigator.of(context).pop();},
                              child: Icon(Icons.arrow_back)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                           Text(
                            "visit_details".tr(),
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.008,
                      ),
                      const PublicInformationContainer(
                        name: 'عبدالرحمن محمد علي',
                        phone: '+966 4644 4646',
                        date: '23 / 5 / 2024',
                        time: '5:30 مساءً',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.012,
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.12
                            : MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                    "Sales_Invoices".tr(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.008,
                                  ),
                                  Image.asset(
                                    'assets/images/BillList.png',
                                    color: const Color(0xffDCDFE3),
                                    height: MediaQuery.of(context)
                                                .orientation ==
                                            Orientation.portrait
                                        ? MediaQuery.of(context).size.height *
                                            0.032
                                        : MediaQuery.of(context).size.height *
                                            0.058,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.004,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InvoicesContainer(
                                    pillType: 'مبيعات 500 ر.س',
                                    pillNumber: 'فاتورة رقم 123414',
                                    date: 'اصدار بتاريخ 21 / 8 / 2024',
                                   productNote: '50 منتج',
                                    color: Color(0xff0056C9),
                                    icon: 'assets/images/marketImage.png',
                                  ),
                                  InvoicesContainer(
                                    pillType: 'مبيعات 500 ر.س',
                                    pillNumber: 'فاتورة رقم 123414',
                                    date: 'اصدار بتاريخ 21 / 8 / 2024',
                                   productNote: '50 منتج',
                                    color: Color(0xff0056C9),
                                    icon: 'assets/images/marketImage.png',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018,
                      ),
                       SearchTextField(hintTextField: "search_product".tr(),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018,
                      ),
                       BillContainer(containerName: "invoice".tr(),),
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

