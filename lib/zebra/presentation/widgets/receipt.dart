import 'dart:convert';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
class Receipt {
  BlueThermalPrinter printer = BlueThermalPrinter.instance;


  sample({InvoiceData? invoiceData}) async {
    print("2");

    printer.isConnected.then((isConnected) {
      print("3");
   //   if (isConnected!) {
        print("4");


        final companyName = invoiceData!.company == null ? '' : invoiceData.company!.name;
        final companyVat = invoiceData.company == null ? '' : invoiceData.company!.vat;
        final invoiceNumber = "542332443";
        final invoiceDate = "5/12/2024";
        final salesman = "salesman";
        final customerName = "customer name";
        final customerVat =  "customer vat";
        final customerCr = "customer cr";
        List<Items>? items = invoiceData.items == null ? [] : invoiceData.items ;
        Totals? totals =  invoiceData.totals ;

      // Define the receipt data with proper formatting
      String receiptData = '''
------------------------------------------
          $companyName
          VAT ID: $companyVat
------------------------------------------
          Tax Invoice / فاتوره ضريبيه
              ORIGINAL الاصل
------------------------------------------
Invoice No: $invoiceNumber
Date: $invoiceDate
Customer Name: $customerName
Customer VAT#: $customerVat
Customer CR#: $customerCr
------------------------------------------
Salesman: $salesman
------------------------------------------
Prd Code  | Description     | Qty | Price  | Disc | VAT  | Total
---------------------------------------------------------------
''';

// Format the items with proper alignment
      for (var item in items!) {
        receiptData +=
        '${item.productCode.toString().padRight(9)} | ${item.productName.toString().padRight(15)} | '
            '${item.quantity.toString().padLeft(3)} | ${item.priceUnit!.toStringAsFixed(2).padLeft(7)} | '
            '${item.discount!.toStringAsFixed(2).padLeft(5)} | ${item.tax!.padLeft(5)} | '
            '${item.priceSubtotal!.toStringAsFixed(2).padLeft(7)}\n';
      }

      receiptData += '''
---------------------------------------------------------------
Total Quantity: ${totals!.quantity.toString().padLeft(7)}
Total Price: ${totals.price!.toStringAsFixed(2).padLeft(10)}
Total Discount: ${totals.discount!.toStringAsFixed(2).padLeft(7)}
VAT: ${totals.vat!.toStringAsFixed(2).padLeft(15)}
Grand Total: ${totals.grandTotal!.toStringAsFixed(2).padLeft(11)}
---------------------------------------------------------------
Salesman Signature               Customer Signature
-------------------              -------------------
''';




        print("5");
        // Send data to the printer
       BluetoothPrintService.sendPrintData(receiptData);



        print("6");
     // }
    }).catchError((error){
      print("error : ${error}");
    });
  }
}

class BluetoothPrintService {
  static const platform = MethodChannel('com.example.bluetoothprint');

  static Future<void> sendPrintData(String printData) async {
    try {
      await platform.invokeMethod('sendPrintData', {'data': printData});
    } catch (e) {
      print("Failed to send print data: $e");
    }
  }
}