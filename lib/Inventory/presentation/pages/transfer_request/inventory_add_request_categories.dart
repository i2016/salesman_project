
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Inventory/presentation/pages/transfer_request/inventory_second_add_request_screen.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/widgets/categories_widget.dart';
import 'package:water/widgets/products_and_prices_inventory_add_request_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart' as translator;

import 'package:localize_and_translate/localize_and_translate.dart';

class InventoryAddRequestCategories extends StatefulWidget {
  List<CategoryData>? categories;
  InventoryAddRequestCategories({this.categories});

  @override
  State<StatefulWidget> createState() {
    return InventoryAddRequestCategoriesState();
  }
}

class InventoryAddRequestCategoriesState extends State<InventoryAddRequestCategories> {
  TextEditingController controller = new TextEditingController();
  List<CategoryData>? filteredCategories = [];

  @override
  void initState() {
    super.initState();
    filteredCategories = widget.categories;
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.033,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
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
                        hintText: 'search_category'.tr(), // Using tr() method for translation
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 146, 155, 171),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.6,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredCategories!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          await sharedPreferenceManager.writeData(
                              CachingKey.Category_ID,
                              filteredCategories![index].id.toString())
                              .whenComplete(() {
                            customAnimatedPushNavigation(
                              context,
                              InventorySecondAddRequestScreen(
                                categoryData: filteredCategories![index],
                              ),
                            );
                          });
                        },
                        child: CategoriesWidget(
                          categoryData: filteredCategories![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        ProductsAndPricesInventoryAddRequestScreen(
          inventoryCategory: true,
        ),
      ],
    );
  }
}
