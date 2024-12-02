import 'dart:convert';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:intl/intl.dart';
import 'package:water/zebra/data/models/receipt_model.dart';
class Receipt {
  BlueThermalPrinter printer = BlueThermalPrinter.instance;


  sample({RecieptModel? recieptModel}) async {
    print("2");

    printer.isConnected.then((isConnected) {
      print("3");
      print("isConnected : ${isConnected}");
      if (isConnected!) {
        print("4");
        final data = recieptModel!.toJson();
        print("data : ${data}");
        final companyName = data['company']['name'];
        final companyVat = data['company']['vat'];
        final invoiceNumber = data['invoice']['number'];
        final invoiceDate = data['invoice']['date'];
        final salesman = data['invoice']['salesman'];
        final customerName = data['invoice']['customer']['name'];
        final customerVat = data['invoice']['customer']['vat'];
        final customerCr = data['invoice']['customer']['cr'];
        final items = data['invoice']['items'];
        final totals = data['invoice']['totals'];

        // Define the receipt data
        String receiptData = '''
    ------------------------------------------
    Company Name: $companyName
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
    Prd Code | Description | Qty | Price | Disc | VAT | Total
    ----------------------------------------------------------
    ''';

        for (var item in items) {
          receiptData += '${item['code']} | ${item['description']} | ${item['quantity']} | '
              '${item['price']} | ${item['discount']} | ${item['vat']} | ${item['total']}\n';
        }

        receiptData += '''
    ------------------------------------------
    Total Quantity: ${totals['quantity']}
    Total Price: ${totals['price']}
    Total Discount: ${totals['discount']}
    VAT: ${totals['vat']}
    Grand Total: ${totals['grandTotal']}
    ------------------------------------------
    Salesman Signature      Customer Signature
    -------------------     -------------------
    ''';

        // Send data to the printer
        printer.printCustom(receiptData, 0, 1);




        print("5");


       /* bluetooth.printNewLine();
        bluetooth.printCustom("Type your company name here", 4, 1);
        bluetooth.printCustom("Factory", 4, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom(dateNow.toString(), 2, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom(timeNow.toString(), 2, 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Agent Name :", agentName.toString(), 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Supplier ID :", supId.toString(), 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Supplier Name :", supName.toString(), 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Gross Weight :", grossWeight.toString() + " Kg", 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Total Deduction", totDeduct.toString() + " Kg", 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Net Weight :", netWeight.toString() + " Kg", 1);
        bluetooth.printNewLine();
        bluetooth.printCustom("Thank You ...!", 3, 1);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();*/

      }
    });
  }
}