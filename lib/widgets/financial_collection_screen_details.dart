import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';
import 'package:water/Clients/presentation/bloc/invoice_history_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/deserved_invoices_item.dart';
import 'package:water/collection_receipit_details_screen.dart';
import 'package:water/widgets/financial_collection_payment_widget.dart';
import 'package:water/widgets/first_container_in_financial_collection.dart';
import 'package:water/widgets/payment_method_financial_collection.dart';
import 'package:water/widgets/pill_payment_financial_collection.dart';
import 'package:water/widgets/take_photo_widget.dart';

class FinancialCollectionScreenDetails extends StatefulWidget {
  FinancialCollectionScreenDetails({super.key});

  @override
  State<FinancialCollectionScreenDetails> createState() => _FinancialCollectionScreenDetailsState();
}

class _FinancialCollectionScreenDetailsState extends State<FinancialCollectionScreenDetails> {
  int inedx= 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                       "financial_collection".tr(),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.255,
                            child: const Divider(
                              thickness: 0.8,
                              color: Color(0xffDCDFE3),
                            ),
                          ),
                           Text(
                             "due_invoices".tr(),
                            style: TextStyle(
                              color: Color(0xff758195),
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.255,
                            child: const Divider(
                              thickness: 0.8,
                              color: Color(0xffDCDFE3),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.008,
                      ),
          
                      BlocBuilder<InvoiceHistoryBloc, AppState>(
                        bloc: invoiceHistoryBloc,
                        builder: (context, state) {
                          if (state is Loading) {
                            return const LoadingPlaceHolder(
                              shimmerType: ShimmerType.list,
                              cellShimmerHeight: 50,
                              shimmerCount: 10,
                            );
                          }
                          else if (state is GetHistoryInvoiceDone) {
                            if(state.invoiceResult != null ){

                              List<Invoice>? invoices =state.invoiceResult!.invoices!.where((element) =>
                              element.type == "invoice").toList();

                              return   Container(
                                  height: Shared.height * 1.5,
                                  child:  SingleChildScrollView(
                                    child:ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: invoices.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        if(index == 0){
                                          sharedPreferenceManager.writeData(CachingKey.INVOICE_ID,  state.invoiceResult!.invoices!
                                              .where((element) => element.type == "invoice").toList()[0].invoiceId.toString());
                                              }
                                        return InkWell(
                                            onTap: (){
                                              sharedPreferenceManager.writeData(CachingKey.INVOICE_ID,  state.invoiceResult!.invoices!
                                                  .where((element) => element.type == "invoice").toList()[index].invoiceId.toString());
                                              setState(() {
                                                inedx = index;
                                                Shared.images_list = [];
                                              });
                                            },
                                            child:  Column(
                                              children: [
                                                DeservedInvoicesItem(
                                                    invoice: invoices[index]
                                                ),

                                              inedx == index ?  FinancialCollectionPaymentWidget(
                                                  invoice: invoices[index],
                                                ) : Container()
                                              ],
                                            ));
                                      }),
                                ),
                              );
                            }
                            else{
                              return Center(
                                child: Text("no_invoices".tr()),
                              );
                            }
          
                          }
                          else if (state is GetHistoryInvoiceErrorLoading) {
                            return Center(
                              child: Text("${state.message}"),
                            );
                          } else {
                            return Container();
                          }
          
                        },
                      )
          
                    ],
                  ),
        ),
              ),
    );
  }
}
