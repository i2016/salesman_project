import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pdf_render/pdf_render.dart'; // For rendering PDF
import 'package:image/image.dart' as img; // For image processing
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:water/xPrinter/presentation/pages/command_tool.dart'; // For downloading PDF

enum CmdType { Tsc, Cpcl, Esc }

class FunctionPage extends StatefulWidget {
  final BluetoothDevice device;
  final String pdfUrl;

  const FunctionPage({required this.device, required this.pdfUrl, super.key});

  @override
  State<FunctionPage> createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  CmdType cmdType = CmdType.Tsc;
  String? pdfUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    pdfUrl = widget.pdfUrl;
  }

  @override
  void deactivate() {
    super.deactivate();
    _disconnect();
  }

  void _disconnect() async {
    await BluetoothPrintPlus.disconnect();
  }

// Apply thresholding to the image
  void applyThreshold(img.Image image, int threshold) {
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final luminance =
            img.getLuminance(pixel); // Get luminance (grayscale value)
        final newLuminance =
            luminance < threshold ? 0 : 255; // Convert to black or white
        image.setPixel(
            x, y, img.ColorRgb8(newLuminance, newLuminance, newLuminance));
      }
    }
  }

// Function to convert PDF to a list of images (one image per page)
  Future<List<Uint8List>> _convertPdfToImages({required String pdfUrl}) async {
    setState(() {
      _isLoading = true;
    });

    // Download the PDF file
    final response = await http.get(Uri.parse(pdfUrl));
    if (response.statusCode != 200) {
      throw Exception("Failed to download PDF: ${response.statusCode}");
    }

    // Load the PDF from the downloaded data
    final pdfData = response.bodyBytes;
    final pdfDoc = await PdfDocument.openData(pdfData);

    // List to hold the images of each page
    List<Uint8List> pageImages = [];

    // Iterate through all pages of the PDF
    for (int i = 1; i <= pdfDoc.pageCount; i++) {
      // Render the current page of the PDF as an image
      final page = await pdfDoc.getPage(i);
      final pageImage = await page.render(width: 500, height: 800);

      // Create an image from the rendered PDF page
      final image = img.Image.fromBytes(
        width: pageImage.width,
        height: pageImage.height,
        bytes: pageImage.pixels.buffer, // Use the pixel buffer
        order: img.ChannelOrder.bgra, // Specify the pixel format (ARGB)
      );

      // Resize the image to match the printer's printable width
      const int printerWidth = 576; // Example: 76mm printer (576 pixels)
      final double aspectRatio = image.height / image.width;
      final int newHeight = (printerWidth * aspectRatio).round();
      final resizedImage = img.copyResize(
        image,
        width: printerWidth,
        height: newHeight,
      );

      // Convert the image to grayscale
      final grayscaleImage = img.grayscale(resizedImage);

      // Increase contrast (optional, adjust the factor as needed)
      img.adjustColor(grayscaleImage, contrast: 1.5); // Increase contrast

      // Apply thresholding to the image
      const int threshold = 128; // Adjust this value as needed
      applyThreshold(grayscaleImage, threshold);

      // Convert the thresholded image to Uint8List (PNG format)
      final pngBytes = img.encodePng(grayscaleImage); // Use 'img.encodePng'
      pageImages.add(Uint8List.fromList(pngBytes));
    }

    setState(() {
      _isLoading = false;
    });

    return pageImages;
  }
//Function To Print PDF From Assets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.device.name),
      ),
      body: SingleChildScrollView(
        child: pdfUrl?.isEmpty == true
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        "No PDF Available",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: SfPdfViewer.network(
                      pdfUrl ?? "",
                      canShowPaginationDialog: true,
                      onDocumentLoadFailed: (details) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text("Failed to load PDF: ${details.error}")),
                        );
                      },
                    ),
                  ),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlinedButton(
                              onPressed: () async {
                                // Convert PDF to a list of images (one image per page)
                                final List<Uint8List> images =
                                    await _convertPdfToImages(
                                        pdfUrl: pdfUrl ?? "");

                                if (images.isNotEmpty) {
                                  for (final image in images) {
                                    // Generate TSC command for the current image
                                    final cmd =
                                        await CommandTool.tscImageCmd(image);

                                    // Send the command to the printer
                                    await BluetoothPrintPlus.write(cmd);

                                    // Optional: Add a delay between pages to avoid overwhelming the printer
                                    await Future.delayed(const Duration(
                                        seconds: 1)); // Adjust delay as needed
                                  }
                                } else {
                                  debugPrint(
                                      "No images were generated from the PDF.");
                                }
                              },
                              child: const Text("Print PDF"),
                            ),
                          ],
                        ),
                ],
              ),
      ),
    );
  }
}
