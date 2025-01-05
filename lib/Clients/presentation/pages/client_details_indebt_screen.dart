import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/presentation/bloc/invoice_history_bloc.dart';
import 'package:water/Clients/presentation/widgets/client_details_indebt_screen_body.dart';
import 'package:water/Visits/presentation/pages/Today/available_items_screen.dart';

class ClientDetailsIndebtScreen extends StatefulWidget{
  const ClientDetailsIndebtScreen({super.key});

  @override
  State<ClientDetailsIndebtScreen> createState() => _ClientDetailsIndebtScreenState();
}

class _ClientDetailsIndebtScreenState extends State<ClientDetailsIndebtScreen> {
  @override
  void initState() {
    super.initState();
    invoiceHistoryBloc.add(GetHistoryInvoiceEvent());
  }
  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: ClientDetailsIndebtScreenBody(),
        screenButtons:[
          AppButtonWidget(
            asset: 'assets/images/Route.png',
            text: "directions".tr(),
            onClick: () {},
            color: kWhiteColor,
          ),
          AppButtonWidget(
            asset: 'assets/images/phonee.png',
            text: "call_merchant".tr(),
            onClick: () {},
            color: kWhiteColor,
          ),
        ]
    );
  }
}