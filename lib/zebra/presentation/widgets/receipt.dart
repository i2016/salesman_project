import 'dart:convert';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
import 'package:water/zebra/presentation/widgets/image_helper.dart';

class Receipt {
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  sample({InvoiceData? invoiceData}) async {
    print("2");

    printer.isConnected.then((isConnected) async {
      print("3");
      print("4");

      String receiptData = await ReceiptGenerator.generateReceiptWithImages(
          invoiceData: invoiceData);

/*


        final companyName = invoiceData!.company == null ? '' : invoiceData.company!.name;
        final companyVat = invoiceData.company == null ? '' : invoiceData.company!.vat;
        final invoiceNumber = "542332443";
        final invoiceDate = "5/12/2024";
        final salesman = "salesman";
        final customerName = "customer name";
        final customerVat =  "customer vat";
        final customerCr = "customer cr";
        List<Items>? items = invoiceData.items == null ? [] : invoiceData.items ;
        Totals? totals =  invoiceData.totals;

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


*/

      print("5");
      // Send data to the printer
      BluetoothPrintService.sendPrintData(receiptData);

      print("6");
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

class ReceiptGenerator {
/*
  static Future<String> generateReceiptWithImages({InvoiceData? invoiceData}) async {
    int receiptWidth = 80; // Adjust this based on your printer's character width
    // Convert images to base64
    String logoBase64 = await ImageHelper.convertImageToBase64('assets/images/GroupLogo.png');
    String qrBase64 = await ImageHelper.convertImageToBase64('assets/images/qr.png');

    // Receipt content
    StringBuffer receipt = StringBuffer();

    // Add logo
    // Insert image in Base64 format
    receipt.writeln("[IMAGE:$logoBase64]");

    receipt.writeln(centerAlign("SA MADINA DC", receiptWidth));
    receipt.writeln(centerAlign("Tax Invoice / فاتورة ضريبية", receiptWidth));
    receipt.writeln("--------------------------------");
    receipt.writeln("Invoice No: INV/2024/28726");
    receipt.writeln("Date: 2024-11-23");
    receipt.writeln("Delivery Note No: VNP22404663");
    receipt.writeln("Customer Name/اسم العميل:");
    receipt.writeln("OHOD TRADING SUPPLIES");
    receipt.writeln("Cust. VAT: 302186239000003");
    receipt.writeln("Cust. CR: 46O2505723");
    receipt.writeln("Route/خط السير: YMDVS/73");
    receipt.writeln("Salesman: YY000071 - ABDO MUHAMMAD TALABAH");
    receipt.writeln("--------------------------------");

    // Product Table Header
    receipt.writeln(
        "Prd Code        Description           Qty   Price   VAT    TOTAL");
    receipt.writeln("--------------------------------");

    // Product Rows
    receipt.writeln(
        "360020723   195GX20 1             2   250.44  37.57  288.01");
    receipt.writeln(
        "360020734   180GX20X4             1   126.00  16.04  126.01");
    receipt.writeln(
        "360020740   25GX12X5             1   153.00  19.96  153.00");
    receipt.writeln(
        "360020742   25GX16X6 PB          2   216.00  28.08  248.40");
    receipt.writeln(
        "360020725   25GX14X6 BEL         2   192.00  25.08  220.80");
    receipt.writeln("--------------------------------");

    // Totals
    receipt.writeln("TOTAL: SAR 1,863.13");
    receipt.writeln("VAT: SAR 279.47");
    receipt.writeln("GRAND TOTAL: SAR 2,142.60");
    receipt.writeln("--------------------------------");

    // Add QR code
    receipt.writeln("[IMAGE:$qrBase64]");

    // Footer
    receipt.writeln("Amounts are in SAR (ريال)");
    receipt.writeln("Printed on: 26/11/2024 09:07");
    receipt.writeln(
        "Payment of Delivery Note value is approved by a collection voucher");
    receipt.writeln("**** THANK YOU ****");

    return receipt.toString();
  }
*/

  static Future<String> generateReceiptWithImages(
      {InvoiceData? invoiceData}) async {
    int receiptWidth =
        70; // Adjust this based on your printer's character width

    // Convert images to base64
    String logoBase64 =
        await ImageHelper.convertImageToBase64('assets/images/GroupLogo.png');
    String qrBase64 =
        await ImageHelper.convertImageToBase64('assets/images/qr.png');

    // Receipt content
    StringBuffer receipt = StringBuffer();

    // Add logo
    receipt.writeln("[IMAGE:$logoBase64]");

    // Add company name
    if (invoiceData?.company?.name != null) {
      receipt.writeln(centerAlign(invoiceData!.company!.name!, receiptWidth));
    }
    receipt.write("\n");
    receipt.writeln(centerAlign(
        "Vat ID:    ${invoiceData?.company?.vat ?? "N/A"} الضريبى ",
        receiptWidth));
    receipt.write("\n");
    receipt.writeln(centerAlign("SA MADINA DC", receiptWidth));
    receipt.writeln(centerAlign("Tax Invoice / فاتورة ضريبية", receiptWidth));
    receipt.writeln(centerAlign("ORIGINAL / الاصل", receiptWidth));

    // Add Invoice details
    receipt.writeln(alignLeftRight(
        "Invoice No:", "${invoiceData!.company!.invoiceNumber}", receiptWidth));
    receipt.writeln(alignLeftRight("${'Date:'.padRight(20)} ",
        "${invoiceData!.company!.invoiceDate}", receiptWidth));
    receipt.writeln("Customer Name/اسم العميل:");
    receipt.writeln(invoiceData.company?.customerName ?? "Unknown Customer");
    receipt.writeln(alignLeftRight("${'Cust. VAT:'.padRight(20)}",
        "${invoiceData?.company?.customerVat ?? "N/A"}", receiptWidth));
    receipt.writeln(alignLeftRight(
        "${'Cust. CR:'.padRight(20)}",
        "${invoiceData?.company?.customerRegistrationNumber ?? "N/A"}",
        receiptWidth));

    receipt.writeln(alignLeftRight("${'Salesman:'.padRight(20)}",
        "${invoiceData?.company?.salesman ?? "N/A"}", receiptWidth));
    receipt.writeln('-' * receiptWidth);
    // Product Table Header
    receipt.writeln("${"Prd Code".padRight(20)}${"Description"}");
    receipt.writeln(
        "${"".padRight(20)}${"Qty".padRight(10)}${"Price".padRight(10)}${"Disc".padRight(10)}"
        "${"VAT".padRight(10)}${"TOTAL".padRight(10)}");
    receipt.writeln('-' * receiptWidth);

    // Add Products
    if (invoiceData?.items != null) {

      for (var item in invoiceData!.items!) {
        // Adjust column widths as needed
        String total = (item.priceSubtotal?.toStringAsFixed(2) ?? "0");
        String tax = (item.tax ?? "0");
        String discount = (item.discount?.toStringAsFixed(2) ?? "0");
        String priceUnit = (item.priceUnit?.toStringAsFixed(2) ?? "0");
        String quantity = (item.quantity?.toStringAsFixed(2) ?? "0");
        String description = (item.description ?? "N/A");
        String productCode = (item.productCode ?? "N/A");

        receipt.writeln(
            "${productCode.padRight(20)}${description.isEmpty ? 'description' : description} ");
        receipt.writeln(
            "${"".padRight(20)}${quantity.padRight(10)}${priceUnit.padRight(10)}${discount.padRight(10)}"
            "${tax.padRight(10)}${total.padRight(10)}");
      }
    } else {
      receipt.writeln("No items available");
    }
    receipt.writeln('-' * receiptWidth);

    // Add Totals
    if (invoiceData?.totals != null) {
      receipt.writeln(alignLeftRight(
          "GRAND TOTAL:",
          "${invoiceData.totals!.grandTotal?.toStringAsFixed(2) ?? "0.00"} SAR ",
          receiptWidth));
    } else {
      receipt.writeln("TOTAL: SAR 0.00");
      receipt.writeln("VAT: SAR 0.00");
      receipt.writeln("GRAND TOTAL: SAR 0.00");
    }
    receipt.writeln('-' * receiptWidth);
    // Add QR code
     receipt.writeln("[IMAGE:$qrBase64]");

    // Footer
    receipt.writeln(centerAlign("Amounts are in SAR (ريال)", receiptWidth));
    receipt.writeln(centerAlign(
        "Printed on: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}"
        " ${DateFormat('HH:mm').format(DateTime.now())}",
        receiptWidth));
    receipt.writeln(
        centerAlign("Payment of Delivery Note value is only", receiptWidth));
    receipt
        .writeln(centerAlign("approved by a collection voucher", receiptWidth));
    return receipt.toString();
  }

  static String centerAlign(String text, int totalWidth) {
    int padding = (totalWidth - text.length) ~/ 2;
    String spaces = ' ' * padding;
    return spaces + text + spaces;
  }

  static String alignLeftRight(String left, String right, int width) {
    // Calculate available space for padding
    int padding = width - left.length - right.length;
    padding = padding < 0 ? 0 : padding;
    return left + ' ' * padding + right;
  }
}
