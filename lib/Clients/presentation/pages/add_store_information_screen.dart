import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/data/models/add_client_response_model.dart';
import 'package:water/Clients/presentation/bloc/clients_bloc.dart';
import 'package:water/Clients/presentation/pages/clients_screen.dart';
import 'package:water/Clients/presentation/widgets/add_store_information_screen_body.dart';

class AddStoreInformationScreen extends StatelessWidget{
  const AddStoreInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child:AddStoreInformationScreenBody(),
      menuType: "clientMenu",
      screenButtons: [

        AppButtonWidget(
          asset: 'assets/images/cancell.png',
          text: "cancel_client".tr(),
          onClick:() {
            clientsBloc.resetClientData();
            customAnimatedPushNavigation(context, ClientsScreen());

          } ,
          color: kWhiteColor,
        ),
      ],

    );

  }
}