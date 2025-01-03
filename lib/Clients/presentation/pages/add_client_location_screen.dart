import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/presentation/bloc/invoice_history_bloc.dart';
import 'package:water/Clients/presentation/pages/clients_screen.dart';
import 'package:water/Clients/presentation/widgets/add_client_location_screen_body.dart';
import 'package:water/Base/common/dialogs.dart';

class AddClientLocationScreen extends StatefulWidget{
  const AddClientLocationScreen({super.key});

  @override
  State<AddClientLocationScreen> createState() => _AddClientLocationScreenState();
}

class _AddClientLocationScreenState extends State<AddClientLocationScreen> {


  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: AddClientLocationScreenBody(),
      menuType: "clientMenu",
      screenButtons: [
        AppButtonWidget(
          asset: 'assets/images/ChCircle.png',
          text: "save_client".tr(),
          onClick: () {
            Dialogs.showDialogSaveClient(context);
          },
        ),
        AppButtonWidget(
          asset: 'assets/images/cancell.png',
          text: "cancel_client".tr(),
          onClick: () {
            customAnimatedPushNavigation(context, ClientsScreen());

          },
          color: kWhiteColor,
        ),
      ],

    );
  }
}