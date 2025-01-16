// import 'dart:convert';
// import 'dart:ui' as ui;

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
// import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
// import 'package:image/src/image/image.dart';
import 'package:intl/intl.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
import 'package:water/zebra/presentation/widgets/image_helper.dart';

class Receipt {
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  sample({InvoiceData? invoiceData}) async {
    print("@@@@@@@@@@@@@@@@@@@@2");

    printer.isConnected.then((isConnected) async {
      print("3");
      print("4");

      String receiptData = await ReceiptGenerator.generateReceiptWithImages(
          invoiceData: invoiceData);

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
    // receipt.writeln("[IMAGE:$logoBase64]");

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
    receipt.writeln(centerAlign('-' * 30, receiptWidth));
    // Product Table Header
    receipt.writeln("${"Prd Code".padRight(20)}${"Description"}");
    receipt.writeln(
        "${"".padRight(20)}${"Qty".padRight(10)}${"Price".padRight(10)}${"Disc".padRight(10)}"
        "${"VAT".padRight(10)}${"TOTAL".padRight(10)}");
    receipt.writeln(centerAlign('-' * 40, receiptWidth));

    // Add Products
    if (invoiceData.items != null) {
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
    receipt.writeln(centerAlign('-' * 40, receiptWidth));

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
    receipt.writeln(centerAlign('-' * 40, receiptWidth));
    // Add QR code
    //   receipt.writeln("[IMAGE:$qrBase64]");

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
