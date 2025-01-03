import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:rxdart/rxdart.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Returns/presentation/bloc/returns_invoice_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/previous_invoices_screen_details.dart';
import 'package:water/Base/common/dialogs.dart';

class PreviousInvoicesScreen extends StatefulWidget{
  const PreviousInvoicesScreen({super.key});

  @override
  State<PreviousInvoicesScreen> createState() => _PreviousInvoicesScreenState();
}

class _PreviousInvoicesScreenState extends State<PreviousInvoicesScreen> {

  @override
  void initState() {
    super.initState();
    returnsInvoiceBloc.add(GetReturnsInvoiceEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: PreviousInvoicesScreenDetails(),
      screenButtons: [
        AppButtonWidget(
          asset: 'assets/images/ChCircle.png',
          text:  "end_visit".tr(),
          onClick: () => Dialogs.showDialogFinishVisit(context),
        ),
      ],
      menuType:  "subMenu",
    );
  }
}