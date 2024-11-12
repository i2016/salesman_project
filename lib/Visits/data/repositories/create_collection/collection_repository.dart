import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/data/models/create_collection/create_collection_response_model.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
import 'package:water/Visits/data/models/today_visits_details_model.dart';
import 'package:water/Visits/data/models/today_visits_model.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
class CollectionRepository{

  Future<CreateCollectionResponseModel?> createCollection() async {
    // Print order payment details
    Shared.collectionPayment.forEach((element) {
      print("element : ${element.method} , ${element.amount}");
    });

    // Print image details
    Shared.images_list.forEach((element) {
      print("image : ${element}");
    });

    // Define request headers
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',
    };

    // Create items list for the request body
    List<Map<String, dynamic>> items = Shared.order_products_list.map((product) {
      return {
        "product_id": product.id,
        "quantity": product.selectedCount,
        "price": product.price,
      };
    }).toList();

/*    // Create payment list for the request body
    List<Map<String, dynamic>> paymentList = Shared.orderPaymentList.map((payment) {
      return {
        "amount": payment.amount,
        "method": payment.method,
        "documents": Shared.images_list.map((file) {
          return {
            "file": file.path, // Use file.path instead of the file object itself
            "filename": basename(file.path), // Include the filename if needed
          };
        }).toList(),
      };
    }).toList();*/
    List<String> validImages = Shared.images_list.where((image) => image != null && image.isNotEmpty).toList();
    // Create request body
    var body = jsonEncode({
      "params": {
        "visit_id": await sharedPreferenceManager.readString(CachingKey.VISIT_ID),
        "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID),
        "invoice_id": await sharedPreferenceManager.readString(CachingKey.INVOICE_ID),
        if(Shared.collectionPayment.isNotEmpty)
        "method": Shared.collectionPayment[0].method,
        if(Shared.collectionPayment.isNotEmpty)
        "amount" : Shared.collectionPayment[0].amount,
        "documents": validImages
      }
    });

    // Make the network request
    return await NetworkUtil.internal().post(
      CreateCollectionResponseModel(),
      baseUrl + createPaymentUrl,
      headers: headers,
      body: body,
    );
  }



}
final CollectionRepository collectionRepository = CollectionRepository();