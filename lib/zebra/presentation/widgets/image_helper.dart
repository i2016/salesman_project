import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class ImageHelper {
  static Future<String> convertImageToBase64(String assetPath) async {
    final ByteData imageData = await rootBundle.load(assetPath);
    final Uint8List bytes = imageData.buffer.asUint8List();
    return base64Encode(bytes);
  }
}