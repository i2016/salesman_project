import 'dart:convert';
import 'dart:ffi';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Inventory/data/models/inventory_transfer_request_response_model.dart';
import 'package:water/Inventory/data/models/sales_remaining_limit_model.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
import 'package:water/Visits/data/models/today_visits_details_model.dart';
import 'package:water/Visits/data/models/today_visits_model.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
class InventoryRepository{

  Future<InventoryTransferRequestResposneModel?> transferRequest() async {
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
        "product_id": /*481,*/ product.id,
        "quantity": /*1,*/ int.parse(product.selectedCount.toString()),
      };
    }).toList();



    // Create request body
    var body = jsonEncode({
      "params": {
        "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID),
        "items": items,
      }
    });

    // Make the network request
    return await NetworkUtil.internal().post(
      InventoryTransferRequestResposneModel(),
      baseUrl + inventoryTransferRequestUrl,
      headers: headers,
      body: body,
    );
  }

  Future<SalesRemainingLimitModel?> salesRemainingLimit() async {
    // Define request headers
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',
    };

    var body = jsonEncode({
      "params": {
        "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID),
      }
    });

    // Make the network request
    return await NetworkUtil.internal().post(
      SalesRemainingLimitModel(),
      baseUrl + salesRemainingLimitUrl,
      headers: headers,
      body: body,
    );
  }

}
final InventoryRepository inventoryRepository = InventoryRepository();