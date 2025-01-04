import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/data/models/product_model.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/products_and_prices_available_items_screen.dart';
import 'package:water/widgets/products_and_prices_inventory_add_request_screen.dart';
import 'package:water/widgets/water_item_available_products.dart';

class ListCategoryProducts extends StatefulWidget{
  List<Product>? products;
  CategoryData? categoryData;
  bool? isInventory;
  bool? inventoryHeader;
  ListCategoryProducts({this.categoryData,this.products,this.isInventory = false,
    this.inventoryHeader = false});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListCategoryProductsState();
  }

}

class ListCategoryProductsState extends State<ListCategoryProducts>{

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
    return  SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         widget.inventoryHeader! ?  Row(
           children: [
             Expanded(
               flex: 2,
               child: Column(
                 children: [
      
                   MediaQuery.of(context).orientation == Orientation.portrait
                       ? Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         crossAxisAlignment: CrossAxisAlignment.center,
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
                                Text(
                                 "available_products".tr(),
                                 style: TextStyle(
                                     fontSize: 23, fontWeight: FontWeight.w500),
                               ),
                             ],
                           ),
                           Spacer(),
                           widget.isInventory! ? Container() : ProductsAndPricesAvailableItemsScreen()
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
                                 Text(
                                   widget.categoryData == null ? '' :     '${ widget.categoryData!.name}',
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
                                               0.024,
                                         ),
                                         SizedBox(
                                           width: MediaQuery.of(context).size.width *
                                               0.002,
                                         ),
                                         Text(
                                           widget.categoryData == null ? '' :
                                           '${ widget.categoryData!.productCount} ${"product".tr()} ',
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
                       ),
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
                                   hintText: "search_for_product".tr(),
                                   hintStyle: const TextStyle(
                                     color: Color.fromARGB(255, 146, 155, 171),
                                   )),
                             ),
                           )),
                     ],
                   )
                       : Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Row(
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
                                 width: MediaQuery.of(context).size.width * 0.012,
                               ),
                                Text(
                                 "available_products".tr(),
                                 style: TextStyle(
                                     fontSize: 23, fontWeight: FontWeight.w500),
                               ),
                             ],
                           ),
                           Spacer(),
                           ProductsAndPricesAvailableItemsScreen()
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
                                  Text(
                                   "water".tr(),
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
                                          Text(
                                             "50_products".tr(),
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
                       ),
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
                                   hintText:   "search_for_product".tr(),
                                   hintStyle: const TextStyle(
                                     color: Color.fromARGB(255, 146, 155, 171),
                                   )),
                             ),
                           )),
                     ],
                   )
                 ],
               ),
             ),
             Expanded(
                 flex: 1,
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: ProductsAndPricesInventoryAddRequestScreen(),
                 ))
           ],
         )
             : Column(
           children: [
             MediaQuery.of(context).orientation == Orientation.portrait
                 ? Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   crossAxisAlignment: CrossAxisAlignment.center,
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
                          Text(
                           "available_products".tr(),
                           style: TextStyle(
                               fontSize: 23, fontWeight: FontWeight.w500),
                         ),
                       ],
                     ),
                     Spacer(),
                     widget.isInventory! ? Container()
                         : ProductsAndPricesAvailableItemsScreen()
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
                           Text(
                             widget.categoryData == null ? '' :     '${ widget.categoryData!.name}',
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
                                         0.024,
                                   ),
                                   SizedBox(
                                     width: MediaQuery.of(context).size.width *
                                         0.002,
                                   ),
                                   Text(
                                     widget.categoryData == null ? '' :
                                     '${ widget.categoryData!.productCount} ${"product".tr()} ',
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
                 ),
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
                             hintText:  "search_for_product".tr(),
                             hintStyle: const TextStyle(
                               color: Color.fromARGB(255, 146, 155, 171),
                             )),
                       ),
                     )),
               ],
             )
                 : Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Row(
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
                           width: MediaQuery.of(context).size.width * 0.012,
                         ),
                          Text(
                           "available_products".tr(),
                           style: TextStyle(
                               fontSize: 23, fontWeight: FontWeight.w500),
                         ),
                       ],
                     ),
                     Spacer(),
                     ProductsAndPricesAvailableItemsScreen()
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
                            Text(
                             "water".tr(),
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
                                    Text(
                                     "50_products".tr(),
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
                 ),
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
                             hintText: "search_for_product".tr(),
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
              height: MediaQuery.of(context).size.height * 0.015,
            ),
      
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6,
              ),
              child:  ListView.builder(
                  shrinkWrap: true,
                  //  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return  WaterItemAvailableProducts(
                      product: filteredProducts[index],
                     categoryData: widget.categoryData,
                    );
                  }),
            ),
          ],
        ),
    );
  }

}