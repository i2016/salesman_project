import 'package:flutter/material.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Returns/data/models/returns_invoice_model.dart';
import 'package:water/Returns/presentation/bloc/invoices_details_bloc.dart';
import 'package:water/widgets/invoices_details_screen_body.dart';

class InvoicesDetailsScreen extends StatefulWidget{
  const InvoicesDetailsScreen({super.key, this.invoice});

  final Invoice? invoice;

  @override
  State<InvoicesDetailsScreen> createState() => _InvoicesDetailsScreenState();
}

class _InvoicesDetailsScreenState extends State<InvoicesDetailsScreen> {

  @override
  void initState() {
    super.initState();
    invoicesDetailsBloc.add(GetInvoicesDetailsEvent());
  }
  @override
  Widget build(BuildContext context) {
    print("widget.invoice : ${widget.invoice}");
    return AppScreen(
      child: InvoicesDetailsScreenBody(
        invoice: widget.invoice,
      ),
      screenButtons: [
        AppButtonWidget(
          asset: 'assets/images/ChCircle.png',
          text: 'انهاء الزيارة',
          onClick: () => Dialogs.showDialogFinishVisit(context),
        ),
      ],
      menuType:  "subMenu",
    );
  }
}