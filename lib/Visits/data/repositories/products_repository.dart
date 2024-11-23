import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Visits/data/models/product_model.dart';

class ProductsRepository{

  Future<ProductModel?> getProducts() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      ProductModel(),
      baseUrl + productsByCategoryUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "category_id": await sharedPreferenceManager.readString(CachingKey.Category_ID),
          "salesman_id":  await sharedPreferenceManager.readInt(CachingKey.USER_ID),

        }
      }),);
  }



}
final ProductsRepository productsRepository = ProductsRepository();