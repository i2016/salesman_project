import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Inventory/presentation/pages/transfer_request/inventory_add_request_screen.dart';
import 'package:water/Inventory/presentation/widgets/inventory_screen_body.dart';
import 'package:water/Inventory/presentation/pages/current_requests/current_requests_screen.dart';

class InventoryScreen extends StatelessWidget{
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: InventoryScreenBody(),
        screenButtons:[
          AppButtonWidget(
            asset: 'assets/images/VectorAdddd.png',
            text: "transfer_request".tr(),
            onClick: () {
              customAnimatedPushNavigation(context, InventoryAddRequestScreen());
            },
          ),
          AppButtonWidget(
            asset: 'assets/images/fileImage.png',
            text: "current_requests".tr(),
            onClick: () {
              customAnimatedPushNavigation(context, const CurrentRequestsScreen());
            },
            color: kWhiteColor,
          ),
        ]
    );
  }
}