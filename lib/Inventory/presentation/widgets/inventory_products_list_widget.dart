import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              /*  Row(
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
                      'المنتجات المتاحة',
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.019,
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 247, 245, 245),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/marketImage.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.024,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.002,
                                  ),
                                  Text(
                                    widget.categoryData == null ? '' :     '${ widget.categoryData!.productCount} منتج ',
                                    style: TextStyle(
                                        color: Color(0xff0056C9),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),*/
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
                            hintText: 'البحث عن منتج',
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
         /*       Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.012,
                    ),
                    const Text(
                      'المنتجات المتاحة',
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.019,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.045,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'مياه',
                            style: TextStyle(
                              color: Color(0xff25292E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 247, 245, 245),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/marketImage.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.014,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.002,
                                  ),
                                  const Text(
                                    '50 منتج',
                                    style: TextStyle(
                                        color: Color(0xff0056C9),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),*/
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
                            hintText: 'البحث عن منتج',
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
                  )

                  ,
                );
              }),
        ),
      ],
    );
  }

}