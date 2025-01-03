import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Visits/presentation/bloc/categories_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/available_items_screen_details.dart';

class AvailableItemsScreen extends StatefulWidget{
  const AvailableItemsScreen({super.key});

  @override
  State<AvailableItemsScreen> createState() => _AvailableItemsScreenState();
}

class _AvailableItemsScreenState extends State<AvailableItemsScreen> {

  @override
  void initState() {
    categoriesBloc.add(GetCategoriesEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      menuType:  "subMenu",
      child: AvailableItemsScreenDetails(),
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