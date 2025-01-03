import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/presentation/widgets/client_details_screen_body.dart';

class ClientDetailsScreen extends StatelessWidget{
  const ClientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: ClientDetailsScreenBody(),
        screenButtons:[
          AppButtonWidget(
            asset: 'assets/images/startVisit.png',
            text: "start_transaction".tr(),
            onClick: () {},

          ),
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