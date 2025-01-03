import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Clients/presentation/bloc/invoice_history_bloc.dart';
import 'package:water/widgets/financial_collection_screen_details.dart';

class FinancialCollectionScreen extends StatefulWidget{
  const FinancialCollectionScreen({super.key});

  @override
  State<FinancialCollectionScreen> createState() => _FinancialCollectionScreenState();
}

class _FinancialCollectionScreenState extends State<FinancialCollectionScreen> {
  @override
  void initState() {super.initState();
  invoiceHistoryBloc.add(GetHistoryInvoiceEvent());
  Shared.images_list = [];
  }
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      menuType:  "subMenu",
      child: FinancialCollectionScreenDetails(),
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