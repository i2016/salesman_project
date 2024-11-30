import 'package:flutter/material.dart';
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
class Dialogs {

  static Future<void>? showDialogFinancialCollection(parentContext,{CreateCollectionResponseModel? createCollectionResponseModel}) {
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
                const Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    'تأكد من استلام المبلغ قبل اصدار الفاتورة',
                    style: TextStyle(
                        color: Color(0xFFAC6521),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                    'هل تم تحصيل اجمالي 50,000 ر.س؟',
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
                            const Text(
                              'الرجوع للزيارة',
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
                            const Opacity(
                              opacity: 0.8,
                              child: Text(
                                'تم استلام المبلغ',
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
                const Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    'تم اصدار فاتورة التحصيل',
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                    'تم اصدار فاتورة تحصيل رقم ${createCollectionResponseModel?.result?.data?.paymentId}',
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
                            const Text(
                              'الرجوع للزيارة',
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

                        _printPdf(url: createCollectionResponseModel.result!.data!.paymentPdf!,
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
                            const Opacity(
                              opacity: 0.8,
                              child: Text(
                                'طباعة الفاتورة',
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
                const Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    'تم اصدار فاتورة المرتجع',
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                    'تم اصدار فاتورة مرتجع رقم  ${createReturnsModel?.result?.data?.invoiceReturnId ?? ''}  ',
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
                            const Text(
                              'الرجوع للزيارة',
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

                        _printPdf(url: createReturnsModel.result?.data?.returnsInvoicePdf ?? '',
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
                            const Opacity(
                              opacity: 0.8,
                              child: Text(
                                'طباعة الفاتورة',
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
                    ' تم اصدار فاتورة البيع و يمكنك متابعة مع المخزن'
                        :'تم اصدار فاتورة البيع',
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
                            const Text(
                              'الرجوع للزيارة',
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
                      onTap: createOrderResponseModel!.result == null ? null
                          :createOrderResponseModel!.result!.errorResult != null ? null :(){

                        _printPdf(url: createOrderResponseModel!.result!.invoicePdf!,
                        context: context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        height: MediaQuery.of(context).size.height * 0.038,
                        decoration: BoxDecoration(
                            color:  createOrderResponseModel!.result == null ? kGreyColor
                                :createOrderResponseModel!.result!.errorResult != null ?
                            kGreyColor :Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Opacity(
                              opacity: 0.8,
                              child: Text(
                                'طباعة الفاتورة',
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
                  ? MediaQuery.of(context).size.height * 0.19
                  : MediaQuery.of(context).size.height * 0.37,
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
                  const Text(
                    'تسجيل خروج',
                    style: TextStyle(
                        color: Color(0xffAC6521),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 11),
                    child: Text(
                      'هل انت متأكد من تسجيل الخروج من التطبيق؟',
                      style: TextStyle(
                          color: Color(0xFFAC6521),
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const Text(
                    'تحتاج الى ادخال البريد الالكتروني وكلمة السر للدخول مجدداً',
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
                                const Opacity(
                                  opacity: 0.8,
                                  child: Text(
                                    'تسجيل خروج من التطبيق',
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
                                const Text(
                                  'الرجوع للتطبيق',
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
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Text(
                    'تم تغيير كلمة السر بنجاح',
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
                        const Text(
                          'الرجوع للتطبيق',
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
                const Text(
                  'الغاء اضافة العميل',
                  style: TextStyle(
                      color: Color(0xffAC6521),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    'هل انت متأكد من اضافة العميل؟',
                    style: TextStyle(
                        color: Color(0xFFAC6521),
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const Text(
                  'تحتاج الى ملئ البيانات من البداية في حالة الاضافة مجدداً.',
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
                              const Opacity(
                                opacity: 0.8,
                                child: Text(
                                  'الغاء العميل',
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
                              const Text(
                                'استمرار الاضافة',
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
                const Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    'تم اضافة العميل',
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                    'ملف العميل حالياً تحت المراجعة.',
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
                            const Opacity(
                              opacity: 0.8,
                              child: Text(
                                'اظهار صفحة العميل',
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
                ? MediaQuery.of(context).size.height * 0.19
                : MediaQuery.of(context).size.height * 0.375,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/InfoCircle.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    'هل انت متأكد من انهاء الزيارة؟',
                    style: TextStyle(
                        color: Color(0xff0056C9),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                          'يمكنك بدء الزيارة مجدداً لاصدار فواتير جديدة',
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
                            const Text(
                              'الرجوع للزيارة',
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
                            const Opacity(
                              opacity: 0.8,
                              child: Text(
                                'انهاء الزيارة',
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
                const Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                   'تم ارسال الصور للادارة',
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                   'تم ارسال 4 صور للإدارة',
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
                           const Text(
                             'الرجوع للزيارة',
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
                const Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                   'تم حفظ التعديلات للطلب',
                    style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                   'سيتم الآن مراجعة الطلب',
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
                              const Text(
                                'الرجوع للمخزن',
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
                  const Padding(
                    padding: EdgeInsets.only(top: 11),
                    child: Text(
                      'تم اضافة المنتج الى المخزن',
                      style: TextStyle(
                        color: Color(0xff1D6E4F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16 , top: 10),
                    child: Text(
                      'تم اضافة عدد 2 مياه',
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
                                const Text(
                                  'الرجوع للمخزن',
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
                const Text(
                  'الغاء الطلب',
                  style: TextStyle(
                      color: Color(0xffAC6521),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    'هل انت متأكد من إلغاء الطلب؟',
                    style: TextStyle(
                        color: Color(0xFFAC6521),
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const Text(
                  'تحتاج الى ملئ البيانات من البداية في حالة الطلب مجدداً.',
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
                              const Text(
                                'استمرار الطلب',
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
                              const Opacity(
                                opacity: 0.8,
                                child: Text(
                                  'الغاء الطلب',
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

  static Future<void> _printPdf({String? url,BuildContext? context}) async {
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
        title: "خطا ...",
        text: "حدث خطا اثناء طباعة الفاتورة",
      );
    }
  }


  static Future<void>? showDialogSendRequest(parentContext,{InventoryTransferRequestResposneModel? inventoryTransferRequestResposneModel}) {
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
                  const Padding(
                    padding: EdgeInsets.only(top: 11),
                    child: Text(
                      'تم ارسال الطلب',
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
                          'تم ارسال طلب رقم ${inventoryTransferRequestResposneModel!.result!.data!.transferId}',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'سيتم الآن مراجعة الطلب',
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
                              const Text(
                                'الرجوع للمخزن',
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
}
