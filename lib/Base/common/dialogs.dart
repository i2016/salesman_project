import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pdf/pdf.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/presentation/pages/clients_screen.dart';
import 'package:water/Inventory/data/models/inventory_transfer_request_response_model.dart';
import 'package:water/Inventory/presentation/pages/inventory_screen.dart';
import 'package:water/Returns/data/models/create_returns_model.dart';
import 'package:water/Visits/data/models/create_collection/create_collection_response_model.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
import 'package:water/Visits/data/repositories/visits_repository.dart';
import 'package:water/Visits/presentation/pages/Today/previous_invoices_screen.dart';
import 'package:water/Visits/presentation/pages/Today/visits_today_screen_details.dart';
import 'package:water/index.dart';
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';
import 'package:water/xPrinter/presentation/pages/xPrinter_screen.dart';
import 'package:water/zebra/presentation/pages/zebra_printer_screen.dart';
import 'package:water/zebra/presentation/widgets/receipt.dart';
class Dialogs {

  static Future<void>? showDialogFinancialCollection(parentContext,{CreateCollectionResponseModel?
  createCollectionResponseModel}) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.19
                : MediaQuery.of(context).size.height * 0.365,
            child: Column(
              children: [
                Image.asset(
                  color: Color(0xffDD7208),
                  'assets/images/VectorError.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.013,
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    "ensure_receiving_amount".tr(),
                    style: TextStyle(
                        color: Color(0xFFAC6521),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),

                 Padding(
                    padding: EdgeInsets.only(bottom: 16, top: 10),
                    child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    InkWell(
                      onTap: () {
                        customAnimatedPushNavigation(context, AvailableItemsScreen());

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromARGB(255, 198, 195, 195),
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "return_to_visit".tr(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset('assets/images/arrowww.png'),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        showSecondDialogFinancialCollection(context,createCollectionResponseModel: createCollectionResponseModel!);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Opacity(
                              opacity: 0.8,
                              child: Text(
                                "amount_received".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset(
                                'assets/images/PrinterMinimalistic.png'),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void>? showSecondDialogFinancialCollection(parentContext,
      {CreateCollectionResponseModel? createCollectionResponseModel}) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.19
                : MediaQuery.of(context).size.height * 0.375,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/imagee-truee.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    "invoice_issued".tr(),
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                    ' ${"invoice_number".tr()} ${createCollectionResponseModel?.result?.data?.paymentId}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    InkWell(
                      onTap: () {
                        customAnimatedPushNavigation(context, AvailableItemsScreen());

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromARGB(255, 198, 195, 195),
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "return_to_visit".tr(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset('assets/images/arrowww.png'),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: createCollectionResponseModel!.result == null ? null
                          :createCollectionResponseModel.result!.isError! ? null :(){

                      customAnimatedPushNavigation(context, XPrinterScreen(
                          pdfUrl: createCollectionResponseModel.result!.data!.paymentPdf!,
                        ));
                   /*    printPdf(url: createCollectionResponseModel.result!.data!.paymentPdf!,
                            context: context);*/
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Opacity(
                              opacity: 0.8,
                              child: Text(
                                  "print_invoice".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset(
                                'assets/images/PrinterMinimalistic.png'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return null;
  }

  static Future<void>? showDialogReviewReturnedProducts(parentContext,{CreateReturnsModel? createReturnsModel}) {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.195
                : MediaQuery.of(context).size.height * 0.377,
            child: Column(
              children: [
                Image.asset(
                  color: Color(0xff23A36D),
                  'assets/images/imagee-truee.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.013,
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    "return_invoice_issued".tr(),
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                    ' ${"return_invoice_number".tr()} ${createReturnsModel?.result?.data?.invoiceReturnId ?? ''}  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        customAnimatedPushNavigation(context, PreviousInvoicesScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromARGB(255, 198, 195, 195),
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "return_to_visit".tr(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset('assets/images/arrowww.png'),
                          ],
                        ),
                      ),
                    ),
                    createReturnsModel!.result == null ? Container()
                        :createReturnsModel.result!.data == null ? Container() :
                    createReturnsModel.result?.data?.returnsInvoicePdf == null
                        ? Container() :    InkWell(
                      onTap: (){
                  /*      customAnimatedPushNavigation(context, XPrinterScreen(
                          pdfUrl: createReturnsModel.result?.data?.returnsInvoicePdf ?? '',
                        ));
*/
                  printPdf(url: createReturnsModel.result?.data?.returnsInvoicePdf ?? '',
                            context: context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                            color: Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Opacity(
                              opacity: 0.8,
                              child: Text(
                               "print_invoice".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset(
                                'assets/images/PrinterMinimalistic.png'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void>? showDialogcReateOrderResult(parentContext,{ CreateOrderResponseModel? createOrderResponseModel }) {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              children: [
                Image.asset(
                  color: Color(0xff23A36D),
                  'assets/images/imagee-truee.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.013,
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    createOrderResponseModel!.result == null  ? createOrderResponseModel!.message! :
                    createOrderResponseModel!.result!.errorResult != null ?
                   "follow_up_warehouse".tr()
                        : "sales_invoice_issued".tr(),
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
             /*   const Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                    'تم تحصيل مبلغ 10,000 كاش و 10,000 فيزا',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        customAnimatedPushNavigation(context, AvailableItemsScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).size.height * 0.038,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromARGB(255, 198, 195, 195),
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                             "return_to_visit".tr(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset('assets/images/arrowww.png'),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: createOrderResponseModel.result == null ? null
                          :createOrderResponseModel.result!.errorResult != null ? null :(){

                       customAnimatedPushNavigation(context, XPrinterScreen(
                          pdfUrl: createOrderResponseModel!.result!.invoicePdf!,
                        ));

                   /*     printPdf(url: createOrderResponseModel!.result!.invoicePdf!,
                        context: context);*/

                     /*   Receipt receipt = Receipt();
                        receipt.sample(invoiceData: createOrderResponseModel.result!.invoiceData);*/

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).size.height * 0.038,
                        decoration: BoxDecoration(
                            color:  createOrderResponseModel.result == null ? kGreyColor
                                :createOrderResponseModel.result!.errorResult != null ?
                            kGreyColor :Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Opacity(
                              opacity: 0.8,
                              child: Text(
                                "print_invoice".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset('assets/images/PrinterMinimalistic.png'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  static Future<void>? showDialogProfileLogout(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.22
                  : MediaQuery.of(context).size.height * 0.40,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20)
               ),
              child: Column(
                children: [
                  Image.asset(
                    color: Color(0xffDD7208),
                    'assets/images/VectorError.png',
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.013,
                  ),
                   Text(
                    "logout_title".tr(),
                    style: TextStyle(
                        color: Color(0xffAC6521),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 11),
                    child: Text(
                      "logout_confirmation".tr(),
                      style: TextStyle(
                          color: Color(0xFFAC6521),
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                   Text(
                    "logout_warning".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.27,
                            height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                                ? MediaQuery.of(context).size.height * 0.038
                                : MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffE34935),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Opacity(
                                  opacity: 0.8,
                                  child: Text(
                                   "logout_button".tr(),
                                    style: TextStyle(
                                        color: Color(0xffAF2A1A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.006,
                                ),
                                Image.asset(
                                  'assets/images/LogOut.png',
                                  color: const Color(0xffE34935),
                                  height:
                                  MediaQuery.of(context).size.height * 0.015,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.27,
                            height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                                ? MediaQuery.of(context).size.height * 0.038
                                : MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffDCDFE3),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                 "return_button".tr(),
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.006,
                                ),
                                Image.asset('assets/images/arrowww.png'),
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

        );
      },
    );
  }

  static Future<void>? showDialogChangePassword(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.16,
            child: Column(
              children: [
                Image.asset(
                  color: const Color(0xff23A36D),
                  'assets/images/imagee-truee.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Text(
                    "password_changed_success".tr(),
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                InkWell(
                  onTap: (){
                    customAnimatedPushNavigation(context, ProfileScreen());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    height: MediaQuery.of(context).size.height * 0.038,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromARGB(255, 198, 195, 195),
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          "return_button".tr(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
                        ),
                        Image.asset('assets/images/arrowww.png'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void>? showDialogCancelClient(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.19
                : MediaQuery.of(context).size.height * 0.37,
            child: Column(
              children: [
                Image.asset(
                  color: Color(0xffDD7208),
                  'assets/images/VectorError.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.013,
                ),
                 Text(
                  "client_cancel".tr(),
                  style: TextStyle(
                      color: Color(0xffAC6521),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                   "client_cancel_confirmation".tr(),
                    style: TextStyle(
                        color: Color(0xFFAC6521),
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                 Text(
                 "client_add_warning".tr(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          showSecondDialogFinancialCollection(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.038
                              : MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xffE34935),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Opacity(
                                opacity: 0.8,
                                child: Text(
                                  "client_cancel_button".tr(),
                                  style: TextStyle(
                                      color: Color(0xffAF2A1A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.006,
                              ),
                              Image.asset(
                                'assets/images/cancell.png',
                                color: const Color(0xffE34935),
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.038
                              : MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffDCDFE3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                "client_continue_button".tr(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.006,
                              ),
                              Image.asset('assets/images/arrowww.png'),
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
        );
      },
    );
  }

  static Future<void>? showDialogSaveClient(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait ?
             MediaQuery.of(context).size.height * 0.19
             : MediaQuery.of(context).size.height * 0.38,
            child: Column(
              children: [
                Image.asset(
                  color: Color(0xff23A36D),
                  'assets/images/imagee-truee.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.004,
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                 "client_added".tr(),
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                    "client_under_review".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        customAnimatedPushReplacementNavigation(context, ClientsScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).orientation == Orientation.portrait ?
                        MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.074,
                        decoration: BoxDecoration(
                            color: Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Opacity(
                              opacity: 0.8,
                              child: Text(
                               "show_client_button".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset(
                              'assets/images/InfoCircle.png',
                              height: MediaQuery.of(context).size.height * 0.015,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
              ]
          ),
          ),
        );
      },
    );
  }




  static Future<void>? showDialogFinishVisit(parentContext) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.22
                : MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/InfoCircle.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    "finish_visit_confirmation".tr(),
                    style: TextStyle(
                        color: Color(0xff0056C9),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                         "start_new_visit_warning".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromARGB(255, 198, 195, 195),
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "return_to_visit".tr(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset('assets/images/arrowww.png'),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        customAnimatedPushNavigation(context, VisitsTodayDetailsScreen());
                        visitsRepository.changeVisitStage().then((value){
                          print("value : ${value!.toJson()}");
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Opacity(
                              opacity: 0.8,
                              child: Text(
                                "finish_visit".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.006,
                            ),
                            Image.asset(
                               'assets/images/CheckCircle.png',
                               color: Colors.white,
                               ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return null;
  }

  static Future<void>? showDialogSendPhotos(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait ?
             MediaQuery.of(context).size.height * 0.19
             : MediaQuery.of(context).size.height * 0.38,
            child: Column(
              children: [
                Image.asset(
                  color: Color(0xff23A36D),
                  'assets/images/imagee-truee.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.004,
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                   "photos_sent_to_admin".tr(),
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                  "photos_sent_count".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   InkWell(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child:  Container(
                       width: MediaQuery.of(context).size.width * 0.27,
                       height: MediaQuery.of(context).orientation ==
                           Orientation.portrait
                           ? MediaQuery.of(context).size.height * 0.038
                           : MediaQuery.of(context).size.height * 0.07,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           border: Border.all(
                             color: Color.fromARGB(255, 198, 195, 195),
                             width: 0.8,
                           ),
                           borderRadius: BorderRadius.circular(5)),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                            Text(
                             "return_to_visit".tr(),
                             style: TextStyle(
                                 fontSize: 14, fontWeight: FontWeight.w300),
                           ),
                           SizedBox(
                             width: MediaQuery.of(context).size.width * 0.006,
                           ),
                           Image.asset('assets/images/arrowww.png'),
                         ],
                       ),
                     ),
                   ),
              ],
            ),
              ]
          ),
          ),
        );
      },
    );
  }

  static Future<void>? showDialogSaveEdits(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait ?
             MediaQuery.of(context).size.height * 0.19
             : MediaQuery.of(context).size.height * 0.38,
            child: Column(
              children: [
                Image.asset(
                  color: Color(0xff23A36D),
                  'assets/images/imagee-truee.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.004,
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                   "save_changes_confirmation".tr(),
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                   "review_request".tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        customAnimatedPushNavigation(context, InventoryScreen());
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.038
                              : MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 198, 195, 195),
                                width: 0.8,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/arrowww.png'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.006,
                              ),
                               Text(
                               "return_to_inventory".tr(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                    ),
              ],
            ),
              ]
          ),
          ),
        );
      },
    );
  }

  static Future<void>? showDialogAddProduct(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.55,
            height: MediaQuery.of(context).orientation == Orientation.portrait ?
             MediaQuery.of(context).size.height * 0.19
             : MediaQuery.of(context).size.height * 0.34,
            child: Column(
              children: [
                Image.asset(
                  color: Color(0xff23A36D),
                  'assets/images/imagee-truee.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                   Padding(
                    padding: EdgeInsets.only(top: 11),
                    child: Text(
                      "product_added".tr(),
                      style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(bottom: 16 , top: 10),
                    child: Text(
                      "product_count".tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                          color: Color.fromARGB(255, 215, 211, 211),
                          width: 1.3,
                          ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  "back_to_inventory".tr(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.006,
                                ),
                                Image.asset('assets/images/arrowww.png'),
                              ],
                            ),
                          ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      }
      );
      }


  static Future<void>? showDialogCancelRequest(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.19
                : MediaQuery.of(context).size.height * 0.37,
            child: Column(
              children: [
                Image.asset(
                  color: Color(0xffDD7208),
                  'assets/images/VectorError.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.013,
                ),
                 Text(
                  "cancel_request".tr(),
                  style: TextStyle(
                      color: Color(0xffAC6521),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    "cancel_request_confirmation".tr(),
                    style: TextStyle(
                        color: Color(0xFFAC6521),
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                 Text(
                  "request_info".tr(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.038
                              : MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xffDCDFE3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                             "continue_request".tr(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width * 0.006,
                              ),
                              Image.asset('assets/images/arrowww.png'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          customAnimatedPushNavigation(context, InventoryScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.038
                              : MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xffE34935),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Opacity(
                                opacity: 0.8,
                                child: Text(
                               "cancel_request_btn".tr(),
                                  style: TextStyle(
                                      color: Color(0xffAF2A1A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.006,
                              ),
                              Image.asset(
                                'assets/images/cancell.png',
                                color: const Color(0xffE34935),
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
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
        );
      },
    );
  }

  static void _openPdfUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> printPdf({String? url,BuildContext? context}) async {
    try {
      // Fetch the PDF from the URL
      Shared.showLoadingDialog(context: context!);
      final response = await http.get(Uri.parse(url!));
      if (response.statusCode == 200) {
        // Convert PDF to bytes
        Shared.dismissDialog(context: context);

        final pdfBytes = response.bodyBytes;

        // Print the PDF
        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdfBytes,
        );
      } else {
        Shared.dismissDialog(context: context);

        print('Failed to load PDF');
      }
    } catch (e) {
      print('Error: $e');
      Shared.dismissDialog(context: context!);
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "error".tr(),
        text: "print_error".tr(),
      );
    }
  }


  static Future<void>? showDialogSendRequest(parentContext,{InventoryTransferRequestResposneModel?
  inventoryTransferRequestResposneModel}) {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.height * 0.2
                : MediaQuery.of(context).size.height * 0.38,
            child: Column(
                children: [
                  Image.asset(
                    color: const Color(0xff23A36D),
                    'assets/images/imagee-truee.png',
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.004,
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 11),
                    child: Text(
                     "request_sent".tr(),
                      style: TextStyle(
                          color: Color(0xff1D6E4F),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(bottom: 16, top: 10),
                    child: Column(
                      children: [
                        Text(
                          ' ${"request_sent_id".tr()}  ${inventoryTransferRequestResposneModel!.result!.data!.transferId}',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "review_request".tr(),
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          customAnimatedPushNavigation(context, InventoryScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.038
                              : MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 198, 195, 195),
                                width: 0.8,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                "back_to_inventory".tr(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.006,
                              ),
                              Image.asset('assets/images/arrowww.png'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: inventoryTransferRequestResposneModel.result == null ? null
                            :inventoryTransferRequestResposneModel.result!.data == null ? null :(){

                          /*customAnimatedPushNavigation(context, XPrinterScreen(
                            pdfUrl: inventoryTransferRequestResposneModel.result!.data!.transferPrintout!,
                          ));*/
                          printPdf(url:  inventoryTransferRequestResposneModel.result!.data!.transferPrintout!,
                              context: context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.038
                              : MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Color(0xff1D7AFC),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Text(
                                  "print_request".tr(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.006,
                              ),
                              Image.asset(
                                  'assets/images/PrinterMinimalistic.png'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
            ),
          ),
        );
      },
    );
  }
}
