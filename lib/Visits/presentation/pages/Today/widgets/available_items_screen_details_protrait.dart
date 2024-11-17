import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/presentation/pages/Today/available_products_screen.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/products_and_prices_available_items_screen.dart';
import 'package:water/widgets/categories_widget.dart';
import 'package:water/widgets/search_text_field_available_items_screen.dart';
import 'package:flutter/material.dart';

class AvailableItemsScreenDetailsProtrait extends StatefulWidget {
  List<CategoryData>? categories;
  AvailableItemsScreenDetailsProtrait({super.key,this.categories});

  @override
  State<AvailableItemsScreenDetailsProtrait> createState() => _AvailableItemsScreenDetailsProtraitState();
}

class _AvailableItemsScreenDetailsProtraitState extends State<AvailableItemsScreenDetailsProtrait> {
  TextEditingController controller = new TextEditingController();
  List<CategoryData>? filteredCategories= []; // Assuming `Product` is the class used for products
  @override
  void initState() {
    super.initState();
    filteredCategories= widget.categories;
    controller.addListener(() {
      setState(() {
        filteredCategories = widget.categories!
            .where((product) => product.name!.toLowerCase().contains(controller.text))
            .toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'الأصناف المتاحة',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.019,
                          ),
                          MediaQuery.of(context).orientation == Orientation.portrait ?
                          Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.033,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child:  Padding(
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

                                      hintText: 'البحث عن صنف ',
                                      hintStyle: const TextStyle(
                                        color: Color.fromARGB(255, 146, 155, 171),
                                      )
                                  ),
                                ),
                              )
                          )
                              : Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.053,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child:  Padding(
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

                                      hintText: 'البحث عن صنف',
                                      hintStyle: const TextStyle(
                                        color: Color.fromARGB(255, 146, 155, 171),
                                      )
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
            Container(
              height: Shared.height ,
              child:    ListView.builder(
                  shrinkWrap: true,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount:filteredCategories?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (){
                          sharedPreferenceManager.writeData(CachingKey.Category_ID,filteredCategories![index].id.toString());
                          customAnimatedPushNavigation(context, AvailableProductsScreen(
                            categoryData: filteredCategories![index],
                          ));
                        },
                        child:  CategoriesWidget(
                          categoryData:filteredCategories![index],
                        ));
                  }),
            )
                    ],
                  ),
                ),
                const ProductsAndPricesAvailableItemsScreen()
              ],

        );
  }
}
