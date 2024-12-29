import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class FinancialCollectionPaymentWidget extends StatelessWidget {
  final Invoice invoice;
  FinancialCollectionPaymentWidget({super.key,required this.invoice});


  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: createCollectionBloc,
        listener: (context, state) {
      if(state is CreateCollectionLoading){

        Shared.showLoadingDialog(context: context);
      }
      else if(state is CreateCollectionDone){
        Shared.dismissDialog(context: context);
        CreateCollectionResponseModel createCollectionResponseModel
          = state.createCollectionResponseModel as CreateCollectionResponseModel;
        Dialogs.showDialogFinancialCollection(context,
        createCollectionResponseModel: createCollectionResponseModel);
        Shared.images_list = [];
        Shared.collectionPayment = [];

      }
      else if(state is CreateCollectionErrorLoading){
        print("ErrorLoading");
        print("state.message : ${state.message}");

        Shared.dismissDialog(context: context);
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "خطا ...",
          text: state.message,
        );

      }
    },
    child:Directionality(
      textDirection: TextDirection.rtl,
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

    )   );
  }
}
