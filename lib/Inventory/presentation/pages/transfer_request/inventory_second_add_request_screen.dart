import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Inventory/presentation/bloc/main_inventory_bloc.dart';
import 'package:water/Inventory/presentation/pages/inventory_screen.dart';
import 'package:water/Inventory/presentation/pages/transfer_request/inventory_second_add_request_screen_body.dart';
import 'package:water/Visits/data/models/category_model.dart';

class InventorySecondAddRequestScreen extends StatefulWidget{
  CategoryData? categoryData;
   InventorySecondAddRequestScreen({super.key,this.categoryData});

  @override
  State<InventorySecondAddRequestScreen> createState() => _InventorySecondAddRequestScreenState();
}

class _InventorySecondAddRequestScreenState extends State<InventorySecondAddRequestScreen> {
  @override
  void initState() {
    mainInventoryBloc.add(GetMainInventoryProductsUnderSpecficCategoryEvent());
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
            text: "cancel_request".tr(),
            onClick: () {
              customAnimatedPushNavigation(context, InventoryScreen());
            },
            color: kWhiteColor,
          ),
        ]
    );

  }
}