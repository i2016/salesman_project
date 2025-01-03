import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/products_and_prices_available_products_when_add_product_screen.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/widgets/button.dart';
import 'package:water/widgets/search_text_field_available_products_screen.dart';
import 'package:water/widgets/store_deal_container_widget.dart';
import 'package:water/widgets/water_item_available_products.dart';


class AvailableProductsWhenAddProductScreenDetails extends StatelessWidget{
  AvailableProductsWhenAddProductScreenDetails({super.key});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
       child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 18 ,left: 18 , top: 48 ),
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
          height: MediaQuery.of(context).orientation == Orientation.portrait ?
          MediaQuery.of(context).size.height * 0.041
          : MediaQuery.of(context).size.height * 0.052,
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
                  onTap: () {},
                  child: const ImageIcon(
                      AssetImage('assets/images/Icon-Wrappppper.png')),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                 Opacity(
                  opacity: 0.8,
                  child: Text("hide_list".tr()),
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
                      height: MediaQuery.of(context).orientation == Orientation.portrait ?
                             MediaQuery.of(context).size.height * 0.056
                            : MediaQuery.of(context).size.height * 0.092,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Column(
                          children: [
                          InkWell(
                              onTap: () => Dialogs.showDialogFinishVisit(context),
                              child:  Button(
                                color: Colors.black,
                                iconImage: 'assets/images/ChCircle.png',
                                buttonName:  "end_visit".tr(),
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
                  flex: 3,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchTextFieldAvailableProductsScreen(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context , index){
                      return  WaterItemAvailableProducts();
                    }
                    ),
                     const Divider(
                    color: Color.fromARGB(255, 186, 180, 180),
                    thickness: 0.9,
                  ),

                ],
              ),
                ),
               const ProductsAndPricesAvailableProductsWhenAddProductScreen()
               ],
          ),
        ),
       )
       );
  }
}


