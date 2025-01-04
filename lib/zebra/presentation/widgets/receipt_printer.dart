// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:image/image.dart' as img;
// import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';

// class ReceiptPrinter {
//   Future<List<int>> generateReceiptData({InvoiceData? invoiceData}) async {



//     // Load printer profile
//     final profile = await CapabilityProfile.load();
//     final generator = Generator(PaperSize.mm80, profile);
//     List<int> bytes = [];

//     // Load logo as Uint8List
//     final ByteData logoData =
//     await rootBundle.load('assets/images/GroupLogo.png');
//     final Uint8List logoBytes = logoData.buffer.asUint8List();
//     // Decode to Image
//     img.Image? decodedImage = img.decodeImage(logoBytes);
//     // Decode to Image
//     //final ui.Image logoImage = await decodeImageFromList(logoBytes);
//     // Add logo image to receipt
//     bytes += generator.imageRaster(decodedImage!);
//     // Add company name
//     if (invoiceData?.company?.name != null) {
//       bytes += generator.text(invoiceData!.company!.name!,
//           styles: const PosStyles(align: PosAlign.center, bold: true));
//     }
//     bytes += generator.text(
//         "Vat ID: ${invoiceData?.company?.vat ?? "N/A"} الضريبى",
//         styles: const PosStyles(align: PosAlign.center));
//     bytes += generator.text("SA MADINA DC", styles: const PosStyles(align: PosAlign.center));
//     bytes += generator.text("Tax Invoice / فاتورة ضريبية",
//         styles: const PosStyles(align: PosAlign.center));
//     bytes += generator.text("ORIGINAL / الاصل",
//         styles: const PosStyles(align: PosAlign.center));

//     // Invoice details
//     bytes += generator.row([
//       PosColumn(
//           text: "Invoice No:",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.left)),
//       PosColumn(
//           text: "${invoiceData?.company?.invoiceNumber ?? "N/A"}",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.right)),
//     ]);
//     bytes += generator.row([
//       PosColumn(
//           text: "Date:",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.left)),
//       PosColumn(
//           text: invoiceData?.company?.invoiceDate ?? "N/A",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.right)),
//     ]);
//     bytes += generator.text("Customer Name/اسم العميل:");
//     bytes += generator.text(invoiceData?.company?.customerName ?? "Unknown Customer");
//     bytes += generator.row([
//       PosColumn(
//           text: "Cust. VAT:",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.left)),
//       PosColumn(
//           text: "${invoiceData?.company?.customerVat ?? "N/A"}",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.right)),
//     ]);
//     bytes += generator.row([
//       PosColumn(
//           text: "Cust. CR:",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.left)),
//       PosColumn(
//           text: "${invoiceData?.company?.customerRegistrationNumber ?? "N/A"}",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.right)),
//     ]);
//     bytes += generator.text('Salesman: ${invoiceData?.company?.salesman ?? "N/A"}');
//     bytes += generator.hr();

//     // Product Table Header
//     bytes += generator.row([
//       PosColumn(text: "Prd Code", width: 2),
//       PosColumn(text: "Description", width: 4),
//       PosColumn(text: "Qty", width: 2),
//       PosColumn(text: "Price", width: 2),
//       PosColumn(text: "VAT", width: 2),
//     ]);
//     bytes += generator.hr();

//     // Add Products
//     if (invoiceData?.items != null) {
//       for (var item in invoiceData!.items!) {
//         bytes += generator.row([
//           PosColumn(text: item.productCode ?? "N/A", width: 2),
//           PosColumn(text: item.description ?? "N/A", width: 4),
//           PosColumn(text: item.quantity?.toStringAsFixed(2) ?? "0", width: 2),
//           PosColumn(text: item.priceUnit?.toStringAsFixed(2) ?? "0", width: 2),
//           PosColumn(text: item.tax ?? "0", width: 2),
//         ]);
//       }
//     } else {
//       bytes += generator.text("No items available");
//     }
//     bytes += generator.hr();

//     // Add Totals
//     bytes += generator.row([
//       PosColumn(
//           text: "GRAND TOTAL:",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.left)),
//       PosColumn(
//           text:
//           "${invoiceData?.totals?.grandTotal?.toStringAsFixed(2) ?? "0.00"} SAR",
//           width: 6,
//           styles: const PosStyles(align: PosAlign.right)),
//     ]);
//     bytes += generator.hr();

//     // Add QR code
//     final ByteData qrData = await rootBundle.load('assets/images/qr.png');
//     final Uint8List qrBytes = qrData.buffer.asUint8List();
//     // Decode to Image
//     img.Image? decodedImageLogo = img.decodeImage(qrBytes);


//     // Add logo image to receipt
//     bytes += generator.imageRaster(decodedImageLogo! );

//     // Footer
//     bytes += generator.text("Amounts are in SAR (ريال)",
//         styles: const PosStyles(align: PosAlign.center));
//     bytes += generator.text(
//         "Printed on: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}",
//         styles: const PosStyles(align: PosAlign.center));
//     bytes += generator.text(
//         "Payment of Delivery Note value is only",
//         styles: const PosStyles(align: PosAlign.center));
//     bytes += generator.text("approved by a collection voucher",
//         styles: const PosStyles(align: PosAlign.center));

//     // Finish with cut command
//     bytes += generator.feed(2);
//     bytes += generator.cut();

//     return bytes;
//   }
// }
