import 'dart:convert';
import 'dart:ffi';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';

class CreateReturnsRepository{

  Future<CreateOrderResponseModel?> createReturns() async {
    // Define request headers
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',
    };

    // Create items list for the request body
    List<Map<String, dynamic>> items = Shared.returns_products_list.map((product) {
      return {
        "product_id":  product.id,
        "quantity":  product.selectedCount,
      };
    }).toList();

    // Create request body
    var body = jsonEncode({
      "params": {
        "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID),
        "invoice_id": await sharedPreferenceManager.readInt(CachingKey.INVOICE_ID),
        "return_type": await sharedPreferenceManager.readInt(CachingKey.RETURNS_TYPE),
        "items": items,
      }
    });

    return await NetworkUtil.internal().post(
      CreateOrderResponseModel(),
      baseUrl + createOrderUrl,
      headers: headers,
      body: body,
    );
  }



}
final CreateReturnsRepository createReturnsRepository = CreateReturnsRepository();