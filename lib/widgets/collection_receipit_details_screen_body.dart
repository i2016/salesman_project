import 'package:flutter/material.dart';
import 'package:water/App/presentation/widgets/Drawer/good_returns_edit_product_drawer.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/widgets/button.dart';
import 'package:water/widgets/image_number_product_price_container_invoices_details.dart';
import 'package:water/widgets/bill_container.dart';
import 'package:water/widgets/search_text_field.dart';
import 'package:water/widgets/store_deal_container_widget.dart';
import 'package:water/widgets/water_item_invoices_details.dart';
import 'package:water/widgets/water_item_previous_invoices.dart';

class CollectionReceipitDetailsScreenBody extends StatelessWidget {
  CollectionReceipitDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          endDrawer: const GoodReturnsEditProductDrawer(),
          body: Padding(
            padding: const EdgeInsets.only(right: 18, left: 18, top: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.041
                              : MediaQuery.of(context).size.height * 0.063,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 11),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){},
                                  child: const ImageIcon(AssetImage(
                                      'assets/images/Icon-Wrappppper.png')),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                const Opacity(
                                  opacity: 0.8,
                                  child: Text('اخفاء القائمة'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        const StoreDealContainer(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.056
                              : MediaQuery.of(context).size.height * 0.092,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => Dialogs.showDialogFinishVisit(context),
                                  child: const Button(
                                    color: Colors.black,
                                    iconImage: 'assets/images/ChCircle.png',
                                    buttonName: 'انهاء الزيارة',
                                    textColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.019,
                          ),
                          const Text(
                            'الفاتورة رقم 123414',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.011,
                      ),
                      const WaterItemPreviousInvoices(
                        saleName: 'مبيعات 500 ر.س',
                        pill: 'فاتورة رقم 123414',
                        date: 'اصدار بتاريخ 21 / 8 / 2024',
                        icon: 'assets/images/marketImage.png',
                        color: Color(0xff0056C9),
                        textIcon: '50 منتج',
                        invoiceId: 1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.011,
                      ),
                      const SearchTextField(
                        hintTextField: 'البحث عن منتج',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.011,
                      ),
                      const BillContainer(containerName: 'الصنف'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.011,
                      ),
                      const ImageNumberProductPriceContainerInvoicesDetails(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return const WaterItemInvoicesDetails();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
