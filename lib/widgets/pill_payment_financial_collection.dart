import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';
import 'package:water/Visits/presentation/bloc/create_collection/create_collection_bloc.dart';
import 'package:water/zebra/presentation/widgets/receipt.dart';

class PillPaymentFinancialCollection extends StatelessWidget {
  final Invoice invoice;
  PillPaymentFinancialCollection({super.key,required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      children: [
                        Image.asset('assets/images/Banknote2.png'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.007,
                        ),
                         Text(
                          '${"remaining".tr()}   ${invoice.amountDue}   ${"sar".tr()}   ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Receipt receipt = Receipt();
                        receipt.sample(invoiceData: invoice.print);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.04
                            : MediaQuery.of(context).size.height * 0.068,
                        decoration: BoxDecoration(
                            color: const Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/CheckCircle.png',
                                color: Color(0xffF9F9F9)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                             Opacity(
                              opacity: 0.7,
                              child: Text(
                                "print_invoice".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Shared.width * 0.1,),
                    InkWell(
                      onTap: invoice.amountDue == 0 ? ()=>false : (){
                        createCollectionBloc.add(CreateCollectionEvent());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.04
                            : MediaQuery.of(context).size.height * 0.068,
                        decoration: BoxDecoration(
                            color:  invoice.amountDue == 0 ? kGreyColor : const Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/CheckCircle.png',
                                color: Color(0xffF9F9F9)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                             Opacity(
                              opacity: 0.7,
                              child: Text(
                               "create_invoice".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

