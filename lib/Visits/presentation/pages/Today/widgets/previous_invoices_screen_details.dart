import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Returns/data/models/returns_invoice_model.dart';
import 'package:water/Returns/presentation/bloc/returns_invoice_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/products_and_prices_previous_invoices_screen.dart';
import 'package:water/widgets/search_text_field_previous_invoices_screen.dart';
import 'package:water/widgets/water_item_previous_invoices.dart';

class PreviousInvoicesScreenDetails extends StatefulWidget {
  PreviousInvoicesScreenDetails({super.key});

  @override
  State<PreviousInvoicesScreenDetails> createState() => _PreviousInvoicesScreenDetailsState();
}

class _PreviousInvoicesScreenDetailsState extends State<PreviousInvoicesScreenDetails> {
  final TextEditingController _searchController = TextEditingController();

  List<Invoice> _filteredInvoice = [];
  List<Invoice> _allInvoices = [];
  bool _isFilteringDone = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  void _searchInvoicesFunc(String query) {
    print("query : $query");
    Future.microtask(() {
      setState(() {
        if (query.isEmpty) {
          _filteredInvoice = _allInvoices; // Reset to show all visits when search is cleared
        } else {
          _filteredInvoice = _allInvoices
              .where((invoice){
            return invoice.invoiceNumber!.toString().toLowerCase().contains(query.toLowerCase() )
                ||    invoice.invoiceDate!.toString().toLowerCase().contains(query.toLowerCase())
                 || invoice.invoiceId!.toString().toLowerCase().contains(query.toLowerCase() )
                || invoice.amountTotal!.toString().toLowerCase().contains(query.toLowerCase() );

          }) .toList();
        }
        _isFilteringDone = true; // Mark filtering as complete
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
         textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

        child: Scaffold(
          body: BlocBuilder<ReturnsInvoiceBloc , AppState>(
            bloc: returnsInvoiceBloc,
            builder: (context , state){
              if(state is Loading){
                return const LoadingPlaceHolder(
                  shimmerType: ShimmerType.list,
                  cellShimmerHeight: 50,
                  shimmerCount: 10,
                );
              }else if(state is GetReturnsInvoiceDone){
                _allInvoices = state.invoiceResult!.invoices!.where((element) => element.type == "invoice").toList();
                final displayInvoices =
                _isFilteringDone  ? _filteredInvoice : _allInvoices;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "previous_invoices".tr(),
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.019,
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery
                                  .of(context)
                                  .orientation == Orientation.portrait
                                  ? MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.033
                                  : MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.054,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 1.5),
                                child: TextField(
                                  controller: _searchController,
                                  cursorColor: const Color.fromARGB(255, 66, 64, 64),
                                  onSubmitted: _searchInvoicesFunc ,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    border: InputBorder.none,
                                    prefixIcon: InkWell(
                                      onTap: () {
                                        _searchInvoicesFunc(_searchController.text);
                                      },
                                      child: Image.asset(
                                        'assets/images/search.png',
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: "search_for_product".tr(),
                                    hintStyle: const TextStyle(
                                      color: Color.fromARGB(255, 146, 155, 171),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.02,),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.6,
                          ),
                          child: displayInvoices.isNotEmpty ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: displayInvoices.length,
                                itemBuilder: (context, index) {
                                  return WaterItemPreviousInvoices(
                                      saleName:   '${"sales".tr()} ${displayInvoices[index].amountTotal?? 500}  ${"sar".tr()}',
                                      pill: ' ${"invoice_number".tr()} ${displayInvoices[index].invoiceId?? 500}',
                                      date: ' ${ "issued_on".tr()} ${displayInvoices[index].invoiceDate?? 500}',
                                      icon: 'assets/images/marketImage.png',
                                      color: Color(0xff0056C9),
                                      textIcon: '${displayInvoices[index].itemsCount?? 500}  ${"product".tr()}',
                                    invoice: displayInvoices[index],
                                  );
                                }): Padding(
                            padding: EdgeInsets.symmetric(vertical: Shared.width * 0.3),
                            child: Center(
                              child: Text("noDataAvailableNow".tr()),
                            ),
                          ),),
                          ],
                        ),
                      ),
                    ),

                     Expanded(child: Container())
                  ],
                );
              }else if(state is GetReturnsInvoiceErrorLoading){
                return Center(
                  child: Text("${state.message}"),
                );
              }else{
                return Container();
              }
            },
          ),
          ),
        );
  }
}
