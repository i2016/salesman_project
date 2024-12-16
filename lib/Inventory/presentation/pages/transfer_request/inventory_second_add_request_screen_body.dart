import 'package:water/App/presentation/bloc/app_bloc.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Inventory/presentation/pages/transfer_request/inventory_transfer_request_products.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/widgets/products_and_prices_inventory_add_request_screen.dart';
import 'package:water/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:water/widgets/water_item_available_products.dart';

class InventorySecondAddRequestScreenBody extends StatelessWidget {
  CategoryData? categoryData;
  InventorySecondAddRequestScreenBody({super.key,this.categoryData});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(
              flex: 3,
              child:  InventoryTransferRequestProducts(
                  categoryData: categoryData,
                ),

            ),


             ProductsAndPricesInventoryAddRequestScreen()
          ],
        ),
      ),
    );
  }
}





