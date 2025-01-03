import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Inventory/presentation/bloc/main_inventory_bloc.dart';
import 'package:water/Inventory/presentation/widgets/inventory_products_screen.dart';


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
                       Row(
                        children: [
                          Text(
                            "water_item_available".tr(),
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
