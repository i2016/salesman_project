import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';
import 'package:water/Visits/data/models/create_collection/create_collection_response_model.dart';
import 'package:water/Visits/presentation/bloc/create_collection/create_collection_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/deserved_invoices_item.dart';
import 'package:water/collection_receipit_details_screen.dart';
import 'package:water/widgets/first_container_in_financial_collection.dart';
import 'package:water/widgets/payment_method_financial_collection.dart';
import 'package:water/widgets/pill_payment_financial_collection.dart';
import 'package:water/widgets/take_photo_widget.dart';
import 'package:water/xPrinter/presentation/pages/xPrinter_screen.dart';

class FinancialCollectionPaymentWidget extends StatelessWidget {
  final Invoice invoice;
  FinancialCollectionPaymentWidget({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: createCollectionBloc,
        listener: (context, state) {
          if (state is CreateCollectionLoading) {
            Shared.showLoadingDialog(context: context);
          } else if (state is CreateCollectionDone) {
            Shared.dismissDialog(context: context);
            CreateCollectionResponseModel createCollectionResponseModel = state
                .createCollectionResponseModel as CreateCollectionResponseModel;
            // Dialogs.showDialogFinancialCollection(context,
            // createCollectionResponseModel: createCollectionResponseModel);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => XPrinterScreen(
                          pdfUrl: createCollectionResponseModel
                                  .result?.data?.paymentPdf ??
                              "",
                          invoiceData: invoice.print,
                        )));
            Shared.images_list = [];
            Shared.collectionPayment = [];
          } else if (state is CreateCollectionErrorLoading) {
            Shared.dismissDialog(context: context);
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: "error".tr(),
              text: state.message,
            );
          }
        },
        child: Directionality(
          textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FirstContainerInFinancialCollection(
                total_amount: invoice.amountTotal.toString(),
              ),
              const PaymentMethodFinancialCollection(),
              const TakePhoto(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.011,
              ),
              PillPaymentFinancialCollection(
                invoice: invoice,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.011,
              ),
            ],
          ),
        ));
  }
}
