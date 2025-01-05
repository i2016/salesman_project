import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/presentation/bloc/clients_bloc.dart';
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
      child:   BlocListener(
          bloc: clientsBloc,
          listener: (context, state) {
            if(state is Loading){
              Shared.showLoadingDialog(context: context);
            }
            else if(state is AddClientDone){
              Shared.dismissDialog(context: context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "add_client_successfully".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                    duration: Duration(seconds: 2),
                  ) );

              Shared.images_list = [];

            }
            else if(state is AddClientErrorLoading){

              Shared.dismissDialog(context: context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "error".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                    duration: Duration(seconds: 2),
                  ) );


            }
          },
          child:AddClientLocationScreenBody()),
      menuType: "clientMenu",
      screenButtons: [
        AppButtonWidget(
          asset: 'assets/images/ChCircle.png',
          text: "save_client".tr(),
          onClick: () {
            if(clientsBloc.validateAddClient()){
              clientsBloc.add(AddClientEvent());
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "error".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                    duration: Duration(seconds: 2),
                  ) );

            }

          },
        ),
        AppButtonWidget(
          asset: 'assets/images/cancell.png',
          text: "cancel_client".tr(),
          onClick: () {
            clientsBloc.resetClientData();
            customAnimatedPushNavigation(context, ClientsScreen());

          },
          color: kWhiteColor,
        ),
      ],

    );
  }
}