import 'package:flutter/material.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Inventory/presentation/bloc/main_inventory_bloc.dart';
import 'package:water/Inventory/presentation/widgets/inventory_products_screen.dart';
import 'package:water/Visits/presentation/bloc/products_bloc.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/review_product_water_item.dart';
import 'package:water/widgets/search_text_field.dart';

class InventoryScreenBody extends StatefulWidget {
  const InventoryScreenBody({super.key});

  @override
  State<InventoryScreenBody> createState() => _InventoryScreenBodyState();
}

class _InventoryScreenBodyState extends State<InventoryScreenBody> {
  @override
  void initState() {
    mainInventoryBloc.add(GetMainInventoryProductsvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'المنتجات المتاحة',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      InventoryProductsScreen(),
          
                    ],
                  ),
        ),
              ),
    );
  }
}
