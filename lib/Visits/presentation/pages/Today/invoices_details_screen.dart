import 'package:flutter/material.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/widgets/invoices_details_screen_body.dart';

class InvoicesDetailsScreen extends StatefulWidget{
  const InvoicesDetailsScreen({super.key, this.invoiceId});

  final int? invoiceId;

  @override
  State<InvoicesDetailsScreen> createState() => _InvoicesDetailsScreenState();
}

class _InvoicesDetailsScreenState extends State<InvoicesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: InvoicesDetailsScreenBody(),
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