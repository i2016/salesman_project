import 'package:flutter/material.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Inventory/presentation/bloc/inventory_transfer_request_bloc.dart';
import 'package:water/Inventory/presentation/pages/current_requests/current_requests_screen_body.dart';
import 'package:water/Inventory/presentation/pages/transfer_request/inventory_add_request_screen.dart';

class CurrentRequestsScreen extends StatefulWidget{
  const CurrentRequestsScreen({super.key});

  @override
  State<CurrentRequestsScreen> createState() => _CurrentRequestsScreenState();
}

class _CurrentRequestsScreenState extends State<CurrentRequestsScreen> {
  @override
  void initState() {
    inventoryTransferRequestBloc.add(GetTransferRequestsHistoryEvent());
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: CurrentRequestsScreenBody(),
        screenButtons:[
          AppButtonWidget(
            asset: 'assets/images/VectorAdddd.png',
            text: 'طلب تحويل',
            onClick: () {
              customAnimatedPushNavigation(context, InventoryAddRequestScreen());

            },
          ),
        ]
    );
  }
}