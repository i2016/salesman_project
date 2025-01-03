import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/data/models/product_model.dart';
import 'package:water/Visits/domain/entities/added_product_entity.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/review_product_water_item.dart';
import 'package:water/widgets/water_item_available_products.dart';

class InventoryProductsListWidget extends StatefulWidget{
  List<Product>? products;
  InventoryProductsListWidget({this.products});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InventoryProductsListWidgetState();
  }

}

class InventoryProductsListWidgetState extends State<InventoryProductsListWidget>{

  TextEditingController controller = new TextEditingController();
  List<Product> filteredProducts =[]; // Assuming `Product` is the class used for products
  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products!;
    controller.addListener(() {
      setState(() {
        filteredProducts = widget.products!
            .where((product) => product.name!.toLowerCase().contains(controller.text))
            .toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            MediaQuery.of(context).orientation == Orientation.portrait
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012,
                ),
                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.033,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.5),
                      child: TextField(
                        controller: controller,
                        cursorColor: Color.fromARGB(255, 66, 64, 64),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            prefixIcon: Image.asset(
                              'assets/images/search.png',
                              color: Colors.black,
                            ),
                            hintText: "search_product".tr(),
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 146, 155, 171),
                            )),
                      ),
                    )),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012,
                ),
                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.053,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.5),
                      child: TextField(
                        controller: controller,
                        cursorColor: Color.fromARGB(255, 66, 64, 64),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            prefixIcon: Image.asset(
                              'assets/images/search.png',
                              color: Colors.black,
                            ),
                            hintText: "search_product".tr(),
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 146, 155, 171),
                            )),
                      ),
                    )),
              ],
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.014,
        ),
        const ImageNumberProductPriceContainer(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Container(
          height: Shared.height ,
          child: ListView.builder(
              shrinkWrap: true,
              //  physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return  ReviewProductWaterItem(
                  addedProductEntity: AddedProductEntity(
                    id: filteredProducts[index].id,
                    name: filteredProducts[index].name,
                    image: filteredProducts[index].image,
                    description: filteredProducts[index].description,
                    price: filteredProducts[index].price,
                    selectedCount: double.parse(filteredProducts[index].count.toString()).toInt(),
                    total: filteredProducts[index].price,
                    unit: UomIds(
                      name: filteredProducts[index].mainUomName,
                      id: filteredProducts[index].mainUomId,
                    )
                  )

                  ,
                );
              }),
        ),
      ],
    );
  }

}