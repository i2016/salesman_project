import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/App/presentation/bloc/app_bloc.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Inventory/presentation/bloc/inventory_transfer_request_bloc.dart';
import 'package:water/Inventory/presentation/bloc/main_inventory_bloc.dart';
import 'package:water/Inventory/presentation/pages/inventory_screen.dart';
import 'package:water/Inventory/presentation/pages/transfer_request/inventory_second_add_request_screen_body.dart';
import 'package:water/Inventory/presentation/widgets/drawer_inventory_current_requests_add_product.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/presentation/bloc/products_bloc.dart';

class InventorySecondAddRequestScreen extends StatefulWidget{
  CategoryData? categoryData;
   InventorySecondAddRequestScreen({super.key,this.categoryData});

  @override
  State<InventorySecondAddRequestScreen> createState() => _InventorySecondAddRequestScreenState();
}

class _InventorySecondAddRequestScreenState extends State<InventorySecondAddRequestScreen> {
  @override
  void initState() {
    mainInventoryBloc.add(GetMainInventoryProductsvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: InventorySecondAddRequestScreenBody(
          categoryData: widget.categoryData,
        ),
        screenButtons:[
          AppButtonWidget(
            asset: 'assets/images/addWithoutBorder.png',
            text: 'إلغاء الطلب',
            onClick: () {
              customAnimatedPushNavigation(context, InventoryScreen());
            },
            color: kWhiteColor,
          ),
        ]
    );

  }
}