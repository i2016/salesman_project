import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/App/presentation/bloc/app_bloc.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Inventory/presentation/pages/transfer_request/inventory_add_request_confirm_screen_body.dart';
import 'package:water/Inventory/presentation/widgets/drawer_edit_inventory_current_request.dart';
import 'package:water/Base/common/dialogs.dart';

class InventoryAddRequestConfirmScreen extends StatefulWidget{
  const InventoryAddRequestConfirmScreen({super.key});

  @override
  State<InventoryAddRequestConfirmScreen> createState() => _InventoryAddRequestConfirmScreenState();
}

class _InventoryAddRequestConfirmScreenState extends State<InventoryAddRequestConfirmScreen> {
  @override
  void initState() {
    appBloc.add(AppDrawrEvent(drawerType: 'editProduct'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
                child: InventoryAddRequestConfirmScreenBody(),
                screenButtons:[
                  AppButtonWidget(
                    asset: 'assets/images/addWithoutBorder.png',
                    text: 'إلغاء الطلب',
                    onClick: () {
                      Dialogs.showDialogCancelRequest(context);


                    },
                    color: kWhiteColor,
                  ),
                ],
            );


  }
}