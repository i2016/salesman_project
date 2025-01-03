import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/presentation/bloc/products_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/available_products_screen_details.dart';

class AvailableProductsScreen extends StatefulWidget{
  CategoryData? categoryData;
   AvailableProductsScreen({super.key,this.categoryData});

  @override
  State<AvailableProductsScreen> createState() => _AvailableProductsScreenState();
}

class _AvailableProductsScreenState extends State<AvailableProductsScreen> {

  @override
  void initState() {
    super.initState();
    productsBloc.add(GetProductsEvent());
  }
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      menuType:  "subMenu",
      child: AvailableProductsScreenDetails(
        categoryData: widget.categoryData,
      ),
      screenButtons: [
        AppButtonWidget(
          asset: 'assets/images/ChCircle.png',
          text:  "end_visit".tr(),
          onClick: () => Dialogs.showDialogFinishVisit(context),
        ),
      ],
    );
  }
}